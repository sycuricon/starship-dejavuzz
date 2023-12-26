analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top RegisterFileSynthesizable_1 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_read_ports_0_addr io_read_ports_1_addr io_read_ports_2_addr io_read_ports_3_addr io_write_ports_0_bits_addr io_write_ports_0_bits_data io_write_ports_1_bits_addr io_write_ports_1_bits_data} -to {}
prove -all