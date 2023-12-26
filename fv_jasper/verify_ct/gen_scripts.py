def gen_scripts():
    file = open('../base_BOOM.tcl', 'r')
    base_content = file.read()
    file.close()

    file = open('../design_info/module_list_BOOM.f', 'r')
    modules = file.read().split('\n')
    file.close()

    file = open('../design_info/io_info_BOOM.txt', 'r')
    io_info = file.read().split('\n')
    file.close()

    for i in range(0, len(modules)):
        content = base_content.replace('-top StarshipSimTop', '-top ' + modules[i])
        input_line = io_info[2*i]
        output_line = io_info[2*i+1]
        if input_line.find('|clock (1)|') < 0:
            content = content.replace('clock clock', 'clock -infer')
        if input_line.find('|reset (1)|') < 0:
            content = content.replace('reset reset', 'reset -none')

        inputs = [x[: x.find(' (')] for x in input_line.split('|')[1:-1]]
        source = []
        for input in inputs:
            if input.find('valid') < 0 and input.find('ready') < 0 and input.find('clock') < 0 and input.find('reset') < 0:
                source.append(input)
        
        outputs = [x[: x.find(' (')] for x in output_line.split('|')[1:-1]]
        sink = []
        for output in outputs:
            if output.find('valid') >= 0 or output.find('ready') >= 0:
                sink.append(output)

        if len(source) == 0 or len(sink) == 0:
            continue
        
        content += '\n' + 'check_spv -create -from {' + ' '.join(source) + '} -to {' + ' '.join(sink) + '}\n'
        content += 'prove -all'

        file = open('scripts/' + modules[i] + '.tcl', 'w')
        file.write(content)
        file.close()



if __name__ == '__main__':
    gen_scripts()