analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top TLBuffer_2 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {auto_in_a_bits_address auto_in_a_bits_data auto_in_a_bits_mask auto_in_a_bits_opcode auto_in_a_bits_param auto_in_a_bits_size auto_in_a_bits_source auto_out_d_bits_corrupt auto_out_d_bits_data auto_out_d_bits_denied auto_out_d_bits_opcode auto_out_d_bits_size auto_out_d_bits_source} -to {auto_in_a_ready auto_in_d_valid auto_out_a_valid auto_out_d_ready}
prove -all