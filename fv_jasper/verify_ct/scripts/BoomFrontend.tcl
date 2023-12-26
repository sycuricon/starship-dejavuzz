analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top BoomFrontend -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { auto_icache_master_out_d_bits_data \
		auto_icache_master_out_d_bits_opcode \
		auto_icache_master_out_d_bits_size \
		io_cpu_brupdate_b2_mispredict \
		io_cpu_brupdate_b2_taken \
		io_cpu_brupdate_b2_uop_ftq_idx \
		io_cpu_brupdate_b2_uop_pc_lob \
		io_cpu_commit_bits \
		io_cpu_flush_icache \
		io_cpu_get_pc_0_ftq_idx \
		io_cpu_get_pc_1_ftq_idx \
		io_cpu_redirect_flush \
		io_cpu_redirect_ftq_idx \
		io_cpu_redirect_ghist_current_saw_branch_not_taken \
		io_cpu_redirect_ghist_new_saw_branch_not_taken \
		io_cpu_redirect_ghist_new_saw_branch_taken \
		io_cpu_redirect_ghist_old_history \
		io_cpu_redirect_ghist_ras_idx \
		io_cpu_redirect_pc \
		io_cpu_redirect_val \
		io_cpu_sfence_bits_addr \
		io_cpu_sfence_bits_rs1 \
		io_cpu_sfence_bits_rs2 \
		io_ptw_pmp_0_addr \
		io_ptw_pmp_0_cfg_a \
		io_ptw_pmp_0_cfg_l \
		io_ptw_pmp_0_cfg_r \
		io_ptw_pmp_0_cfg_w \
		io_ptw_pmp_0_cfg_x \
		io_ptw_pmp_0_mask \
		io_ptw_pmp_1_addr \
		io_ptw_pmp_1_cfg_a \
		io_ptw_pmp_1_cfg_l \
		io_ptw_pmp_1_cfg_r \
		io_ptw_pmp_1_cfg_w \
		io_ptw_pmp_1_cfg_x \
		io_ptw_pmp_1_mask \
		io_ptw_pmp_2_addr \
		io_ptw_pmp_2_cfg_a \
		io_ptw_pmp_2_cfg_l \
		io_ptw_pmp_2_cfg_r \
		io_ptw_pmp_2_cfg_w \
		io_ptw_pmp_2_cfg_x \
		io_ptw_pmp_2_mask \
		io_ptw_pmp_3_addr \
		io_ptw_pmp_3_cfg_a \
		io_ptw_pmp_3_cfg_l \
		io_ptw_pmp_3_cfg_r \
		io_ptw_pmp_3_cfg_w \
		io_ptw_pmp_3_cfg_x \
		io_ptw_pmp_3_mask \
		io_ptw_pmp_4_addr \
		io_ptw_pmp_4_cfg_a \
		io_ptw_pmp_4_cfg_l \
		io_ptw_pmp_4_cfg_r \
		io_ptw_pmp_4_cfg_w \
		io_ptw_pmp_4_cfg_x \
		io_ptw_pmp_4_mask \
		io_ptw_pmp_5_addr \
		io_ptw_pmp_5_cfg_a \
		io_ptw_pmp_5_cfg_l \
		io_ptw_pmp_5_cfg_r \
		io_ptw_pmp_5_cfg_w \
		io_ptw_pmp_5_cfg_x \
		io_ptw_pmp_5_mask \
		io_ptw_pmp_6_addr \
		io_ptw_pmp_6_cfg_a \
		io_ptw_pmp_6_cfg_l \
		io_ptw_pmp_6_cfg_r \
		io_ptw_pmp_6_cfg_w \
		io_ptw_pmp_6_cfg_x \
		io_ptw_pmp_6_mask \
		io_ptw_pmp_7_addr \
		io_ptw_pmp_7_cfg_a \
		io_ptw_pmp_7_cfg_l \
		io_ptw_pmp_7_cfg_r \
		io_ptw_pmp_7_cfg_w \
		io_ptw_pmp_7_cfg_x \
		io_ptw_pmp_7_mask \
		io_ptw_ptbr_mode \
		io_ptw_resp_bits_ae_final \
		io_ptw_resp_bits_ae_ptw \
		io_ptw_resp_bits_homogeneous \
		io_ptw_resp_bits_level \
		io_ptw_resp_bits_pf \
		io_ptw_resp_bits_pte_a \
		io_ptw_resp_bits_pte_d \
		io_ptw_resp_bits_pte_g \
		io_ptw_resp_bits_pte_ppn \
		io_ptw_resp_bits_pte_r \
		io_ptw_resp_bits_pte_u \
		io_ptw_resp_bits_pte_v \
		io_ptw_resp_bits_pte_w \
		io_ptw_resp_bits_pte_x \
		io_ptw_status_debug \
		io_ptw_status_prv} \
	-to { auto_icache_master_out_a_valid \
		io_cpu_fetchpacket_bits_uops_0_valid \
		io_cpu_fetchpacket_valid \
		io_cpu_get_pc_0_entry_cfi_idx_valid \
		io_ptw_req_valid}

check_spv -prove
