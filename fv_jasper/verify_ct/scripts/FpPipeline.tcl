analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top FpPipeline -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_brupdate_b1_mispredict_mask \
		io_brupdate_b1_resolve_mask \
		io_dis_uops_0_bits_br_mask \
		io_dis_uops_0_bits_dst_rtype \
		io_dis_uops_0_bits_exception \
		io_dis_uops_0_bits_fp_val \
		io_dis_uops_0_bits_fu_code \
		io_dis_uops_0_bits_imm_packed \
		io_dis_uops_0_bits_is_amo \
		io_dis_uops_0_bits_is_fence \
		io_dis_uops_0_bits_is_fencei \
		io_dis_uops_0_bits_mem_cmd \
		io_dis_uops_0_bits_pdst \
		io_dis_uops_0_bits_prs1 \
		io_dis_uops_0_bits_prs1_busy \
		io_dis_uops_0_bits_prs2 \
		io_dis_uops_0_bits_prs2_busy \
		io_dis_uops_0_bits_prs3 \
		io_dis_uops_0_bits_prs3_busy \
		io_dis_uops_0_bits_rob_idx \
		io_dis_uops_0_bits_stq_idx \
		io_dis_uops_0_bits_uopc \
		io_dis_uops_0_bits_uses_ldq \
		io_dis_uops_0_bits_uses_stq \
		io_fcsr_rm \
		io_flush_pipeline \
		io_from_int_bits_data \
		io_from_int_bits_fflags_bits_flags \
		io_from_int_bits_fflags_bits_uop_rob_idx \
		io_from_int_bits_predicated \
		io_from_int_bits_uop_br_mask \
		io_from_int_bits_uop_dst_rtype \
		io_from_int_bits_uop_fp_val \
		io_from_int_bits_uop_is_amo \
		io_from_int_bits_uop_pdst \
		io_from_int_bits_uop_rob_idx \
		io_from_int_bits_uop_stq_idx \
		io_from_int_bits_uop_uopc \
		io_from_int_bits_uop_uses_stq \
		io_ll_wports_0_bits_data \
		io_ll_wports_0_bits_uop_br_mask \
		io_ll_wports_0_bits_uop_dst_rtype \
		io_ll_wports_0_bits_uop_fp_val \
		io_ll_wports_0_bits_uop_is_amo \
		io_ll_wports_0_bits_uop_mem_size \
		io_ll_wports_0_bits_uop_pdst \
		io_ll_wports_0_bits_uop_rob_idx \
		io_ll_wports_0_bits_uop_stq_idx \
		io_ll_wports_0_bits_uop_uopc \
		io_ll_wports_0_bits_uop_uses_stq} \
	-to { io_dis_uops_0_ready \
		io_from_int_ready \
		io_to_int_valid \
		io_to_sdq_valid \
		io_wakeups_0_bits_fflags_valid \
		io_wakeups_0_valid \
		io_wakeups_1_bits_fflags_valid \
		io_wakeups_1_valid}

check_spv -prove
