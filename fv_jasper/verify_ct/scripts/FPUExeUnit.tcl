analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top FPUExeUnit -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_brupdate_b1_mispredict_mask io_brupdate_b1_resolve_mask io_fcsr_rm io_req_bits_kill io_req_bits_rs1_data io_req_bits_rs2_data io_req_bits_rs3_data io_req_bits_uop_br_mask io_req_bits_uop_dst_rtype io_req_bits_uop_fp_val io_req_bits_uop_fu_code io_req_bits_uop_imm_packed io_req_bits_uop_is_amo io_req_bits_uop_pdst io_req_bits_uop_rob_idx io_req_bits_uop_stq_idx io_req_bits_uop_uopc io_req_bits_uop_uses_ldq io_req_bits_uop_uses_stq} -to {io_fresp_bits_fflags_valid io_fresp_valid io_ll_iresp_valid}
prove -all