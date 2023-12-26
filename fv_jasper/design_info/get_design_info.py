import sys

def gen_io():
    file = open('module_list_BOOM.f', 'r')
    modules = file.read().split('\n')
    file.close()

    commands = []
    for m in modules:
        commands.append('get_design_info -module ' + m + ' -list input')
        commands.append('get_design_info -module ' + m + ' -list output')

    file = open('../base_BOOM.tcl', 'r')
    content = file.read()
    file.close()

    content += '\n' + '\n'.join(commands)
    file = open('get_design_info.tcl', 'w')
    file.write(content)
    file.close()

def analyze_io():
    file = open('module_list_BOOM.f', 'r')
    modules = file.read().split('\n')
    file.close()

    file = open('../../jgproject/sessionLogs/session_0/jg_session_0.log', 'r')
    content = file .read().split('get_design_info -module ')
    file.close()
    content = content[1:]
    
    io_info = []
    for i in range(0, len(content), 2):
        block = content[i]
        block = block[block.find('-\n')+2 : block.find('\n\n')]
        io_info.append(modules[i//2] + ' inputs: |' + '|'.join(block.split('\n')) + '|')

        block = content[i+1]
        block = block[block.find('-\n')+2 : block.find('\n\n')]
        io_info.append(modules[i//2] + ' outputs: |' + '|'.join(block.split('\n')) + '|')
        
    file = open('io_info_BOOM.txt', 'w')
    file.write('\n'.join(io_info))
    file.close()

if __name__ == '__main__':
    option = sys.argv[1]
    if option == 'gen_io':
        gen_io()
    elif option == 'analyze_io':
        analyze_io()
