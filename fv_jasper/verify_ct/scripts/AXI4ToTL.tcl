analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top AXI4ToTL -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {auto_in_ar_bits_addr auto_in_ar_bits_id auto_in_ar_bits_len auto_in_ar_bits_size auto_in_aw_bits_addr auto_in_aw_bits_id auto_in_aw_bits_len auto_in_aw_bits_size auto_in_w_bits_data auto_in_w_bits_last auto_in_w_bits_strb auto_out_d_bits_corrupt auto_out_d_bits_data auto_out_d_bits_denied auto_out_d_bits_opcode auto_out_d_bits_size auto_out_d_bits_source} -to {auto_in_ar_ready auto_in_aw_ready auto_in_b_valid auto_in_r_valid auto_in_w_ready auto_out_a_valid auto_out_d_ready}
prove -all