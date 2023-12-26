analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top ClockSinkDomain_2 -bbox_m StarshipROM

clock -infer
reset -none -non_resettable_regs 0


check_spv -create -from {auto_uart_0_control_xing_in_a_bits_address auto_uart_0_control_xing_in_a_bits_data auto_uart_0_control_xing_in_a_bits_mask auto_uart_0_control_xing_in_a_bits_opcode auto_uart_0_control_xing_in_a_bits_size auto_uart_0_control_xing_in_a_bits_source auto_uart_0_io_out_rxd} -to {auto_uart_0_control_xing_in_a_ready auto_uart_0_control_xing_in_d_valid}
prove -all