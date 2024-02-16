import sys

big_endian = False
mem_name = 'mem.srams.mem.mem_ext.ram'

def gen_init(dumpfile, regstate):
    file = open(dumpfile, 'r')
    content = file.read()
    file.close()

    # Find the access_time function, get its start and end address
    access_time = content[content.find('uint64_t access_time'): ]
    access_time = access_time[: access_time.find('}')+1]
    start_addr = access_time[access_time.find('    ')+4: access_time.find(':')]
    end_addr = access_time[: access_time.rfind(':')]
    end_addr = end_addr[end_addr.rfind(' ')+1:]
    content = content.replace(start_addr, '')

    content = [line.strip()[1: ] for line in content.split('\n') if line.find('    8')==0]
    initial_values = []
    for line in content:
        addr = line[1:line.find(':')]
        addr = int(addr, 16)
        inst = line[line.find(':')+1:].strip()
        inst = inst[:inst.find(' ')]
        inst_byte = [inst[i: i+2] for i in range(0, len(inst), 2)]
        if not big_endian:
            inst_byte.reverse()
        for i in range(len(inst_byte)):
            if addr%8 + i + 1 <= 8:
                initial_values.append(mem_name + '[' + str(addr//8) + '][' + str((addr%8 + i+1)*8-1) + ':' + str((addr%8 + i)*8) + '] 8\'h' + inst_byte[i])
            else:
                initial_values.append(mem_name + '[' + str(addr//8+1) + '][' + str((addr%8 + i - 7)*8-1) + ':' + str((addr%8 + i - 8)*8) + '] 8\'h' + inst_byte[i])
    
    initial_values = []
    file = open(regstate, 'r')
    content = [line.strip() for line in file.readlines() if line.find('testHarness.') > 0]
    file.close()
    for line in content:
        line = line[line.find('testHarness.')+12: ]
        name = line[: line.find(' =')]
        value = line[line.find('= ')+2: ]
        length = 1
        if name.find(':') >= 0:
            name = name[: name.find('[')]
            head = int(line[line.find('[')+1: line.find(':')])
            tail = int(line[line.find(':')+1: line.find(']')])
            order = head < tail
            length = 1 + abs(head - tail)
            if order:
                indices = list(range(head, tail + 1))
            else:
                indices = list(range(tail, head + 1))
                indices.reverse()
                print(indices)
            
        if value.find(',') >= 0 or value.find('{') >= 0:
            value = value.replace('{', '')
            value = value.replace('}', '')
            value = value.replace(' ', '')
            array = value.split(',')
            for i in range(length):
                #print(name)
                initial_values.append(name + '[' + str(indices[i]) + '] ' + str(len(array[i])) + '\'b' + array[i])
        else:
            initial_values.append(name + ' ' + str(len(value)) + '\'b' + value)

    initfile = dumpfile.replace('dump_files/', 'scripts/')
    file = open(initfile[:initfile.find('.')] + '.init', 'w')
    file.write('\n'.join(initial_values))
    file.close()

    return start_addr[1:], end_addr[1:]

def gen_script(start_addr, end_addr, dumpfile):
    file = open('../base_BOOM.tcl', 'r')
    content = file.read()
    file.close()

    # Set the initial value
    initfile = dumpfile.replace('dump_files/', 'scripts/')
    initfile = initfile[:initfile.find('.')] + '.init'
    content = content.replace('reset reset -non_resettable_regs 0', 'reset reset -non_resettable_regs 0 -init_state ' + 'fv_jasper/initial_assumption/' + initfile)
    
    # Add constraints for legal instructions
    file = open('instr_dict.yaml', 'r')
    instr_dict = [line.strip()[10:] for line in file.readlines() if line.find('encoding: ') >= 0]
    file.close()

    # Generate the constraint for a single instruction
    constraint1 = ''
    constraint2 = ''
    for inst in instr_dict:
        if inst.find('\'') >= 0:
            inst = inst[1:-1]
        # No compressed instructions
        if inst[-2:] != '11':
            continue
        # Extract different fields from inst
        fields = [f for f in inst.split('-') if len(f) > 0]
        condition1 = ''
        condition2 = ''
        position = 0
        temp = inst
        for field in fields:
        # Address range depends on whether the instruction is in the first half or second half of a 64-bit word\
            position = temp.find(field) + position
            temp = temp[temp.find(field)+len(field):]
            condition1 += 'addr[' + str(31-position) + ':' + str(31-position-len(field)+1) + ']==' + str(len(field)) + '\'b' + field + '&&'
            condition2 += 'addr[' + str(63-position) + ':' + str(63-position-len(field)+1) + ']==' + str(len(field)) + '\'b' + field + '&&'
            position += len(field)
        condition1 = condition1[:-2]
        condition2 = condition2[:-2]
        # A legal instruction must satisfy one of these conditions
        constraint1 += condition1 + ' || '
        constraint2 += condition2 + ' || '
    constraint1 = constraint1[:-4]
    constraint2 = constraint2[:-4]
    
    # Apply the constraint to all instructions in memory
    start_addr = int(start_addr, 16)
    end_addr = int(end_addr, 16)
    commands = []
    for i in range(start_addr//4, end_addr//4):
        row = i // 2
        #print(start_addr, end_addr, row)
        if i % 2 == 0:
            commands.append('abstract -init_value {' + mem_name + '[' + str(row) + '][31:0]}')
            commands.append('assume {' + constraint1.replace('addr', mem_name + '[' + str(row) + ']') + '}')
        else:
            commands.append('abstract -init_value {' + mem_name + '[' + str(row) + '][63:32]}')
            commands.append('assume {' + constraint2.replace('addr', mem_name + '[' + str(row) + ']') + '}')

    file = open(initfile.replace('.init', '.tcl'), 'w')
    file.write(content + '\n' + '\n'.join(commands))
    file.close()


if __name__ == '__main__':
    dumpfile = sys.argv[1]
    regstate = sys.argv[2]
    start_addr, end_addr = gen_init(dumpfile, regstate)
    gen_script(start_addr, end_addr, dumpfile)
    
