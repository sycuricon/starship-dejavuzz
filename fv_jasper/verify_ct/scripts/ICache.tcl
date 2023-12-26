analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top ICache -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {auto_master_out_d_bits_data auto_master_out_d_bits_opcode auto_master_out_d_bits_size io_req_bits_addr io_s1_kill io_s1_paddr io_s2_kill} -to {auto_master_out_a_valid io_req_ready io_resp_valid}
prove -all