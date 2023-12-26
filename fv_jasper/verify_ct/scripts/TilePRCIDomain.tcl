analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top TilePRCIDomain -bbox_m StarshipROM

clock -infer
reset -none -non_resettable_regs 0


check_spv -create -from {auto_intsink_in_sync_0} -to {auto_tl_master_clock_xing_out_a_valid auto_tl_master_clock_xing_out_b_ready auto_tl_master_clock_xing_out_c_valid auto_tl_master_clock_xing_out_d_ready auto_tl_master_clock_xing_out_e_valid}
prove -all