analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top Rob -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_brupdate_b1_mispredict_mask \
		io_brupdate_b1_resolve_mask \
		io_brupdate_b2_mispredict \
		io_brupdate_b2_uop_rob_idx \
		io_csr_stall \
		io_debug_wb_wdata_0 \
		io_debug_wb_wdata_1 \
		io_debug_wb_wdata_2 \
		io_debug_wb_wdata_3 \
		io_enq_partial_stall \
		io_enq_uops_0_br_mask \
		io_enq_uops_0_debug_fsrc \
		io_enq_uops_0_debug_inst \
		io_enq_uops_0_debug_pc \
		io_enq_uops_0_dst_rtype \
		io_enq_uops_0_edge_inst \
		io_enq_uops_0_exc_cause \
		io_enq_uops_0_exception \
		io_enq_uops_0_flush_on_commit \
		io_enq_uops_0_fp_val \
		io_enq_uops_0_ftq_idx \
		io_enq_uops_0_is_br \
		io_enq_uops_0_is_fence \
		io_enq_uops_0_is_fencei \
		io_enq_uops_0_is_jal \
		io_enq_uops_0_is_jalr \
		io_enq_uops_0_is_rvc \
		io_enq_uops_0_is_sys_pc2epc \
		io_enq_uops_0_is_unique \
		io_enq_uops_0_ldst \
		io_enq_uops_0_ldst_val \
		io_enq_uops_0_pc_lob \
		io_enq_uops_0_pdst \
		io_enq_uops_0_rob_idx \
		io_enq_uops_0_stale_pdst \
		io_enq_uops_0_uopc \
		io_enq_uops_0_uses_ldq \
		io_enq_uops_0_uses_stq \
		io_fflags_0_bits_flags \
		io_fflags_0_bits_uop_rob_idx \
		io_fflags_1_bits_flags \
		io_fflags_1_bits_uop_rob_idx \
		io_lsu_clr_bsy_0_bits \
		io_lsu_clr_bsy_1_bits \
		io_lxcpt_bits_badvaddr \
		io_lxcpt_bits_cause \
		io_lxcpt_bits_uop_br_mask \
		io_lxcpt_bits_uop_rob_idx \
		io_wb_resps_0_bits_predicated \
		io_wb_resps_0_bits_uop_pdst \
		io_wb_resps_0_bits_uop_rob_idx \
		io_wb_resps_1_bits_uop_pdst \
		io_wb_resps_1_bits_uop_rob_idx \
		io_wb_resps_2_bits_predicated \
		io_wb_resps_2_bits_uop_pdst \
		io_wb_resps_2_bits_uop_rob_idx \
		io_wb_resps_3_bits_uop_pdst \
		io_wb_resps_3_bits_uop_rob_idx \
		io_xcpt_fetch_pc} \
	-to { io_com_xcpt_valid \
		io_commit_arch_valids_0 \
		io_commit_fflags_valid \
		io_commit_rbk_valids_0 \
		io_commit_valids_0 \
		io_flush_valid \
		io_ready}

check_spv -prove
