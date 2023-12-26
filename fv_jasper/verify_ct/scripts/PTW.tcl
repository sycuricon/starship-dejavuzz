analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top PTW -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_dpath_pmp_0_addr \
		io_dpath_pmp_0_cfg_a \
		io_dpath_pmp_0_cfg_l \
		io_dpath_pmp_0_cfg_r \
		io_dpath_pmp_0_cfg_w \
		io_dpath_pmp_0_cfg_x \
		io_dpath_pmp_0_mask \
		io_dpath_pmp_1_addr \
		io_dpath_pmp_1_cfg_a \
		io_dpath_pmp_1_cfg_l \
		io_dpath_pmp_1_cfg_r \
		io_dpath_pmp_1_cfg_w \
		io_dpath_pmp_1_cfg_x \
		io_dpath_pmp_1_mask \
		io_dpath_pmp_2_addr \
		io_dpath_pmp_2_cfg_a \
		io_dpath_pmp_2_cfg_l \
		io_dpath_pmp_2_cfg_r \
		io_dpath_pmp_2_cfg_w \
		io_dpath_pmp_2_cfg_x \
		io_dpath_pmp_2_mask \
		io_dpath_pmp_3_addr \
		io_dpath_pmp_3_cfg_a \
		io_dpath_pmp_3_cfg_l \
		io_dpath_pmp_3_cfg_r \
		io_dpath_pmp_3_cfg_w \
		io_dpath_pmp_3_cfg_x \
		io_dpath_pmp_3_mask \
		io_dpath_pmp_4_addr \
		io_dpath_pmp_4_cfg_a \
		io_dpath_pmp_4_cfg_l \
		io_dpath_pmp_4_cfg_r \
		io_dpath_pmp_4_cfg_w \
		io_dpath_pmp_4_cfg_x \
		io_dpath_pmp_4_mask \
		io_dpath_pmp_5_addr \
		io_dpath_pmp_5_cfg_a \
		io_dpath_pmp_5_cfg_l \
		io_dpath_pmp_5_cfg_r \
		io_dpath_pmp_5_cfg_w \
		io_dpath_pmp_5_cfg_x \
		io_dpath_pmp_5_mask \
		io_dpath_pmp_6_addr \
		io_dpath_pmp_6_cfg_a \
		io_dpath_pmp_6_cfg_l \
		io_dpath_pmp_6_cfg_r \
		io_dpath_pmp_6_cfg_w \
		io_dpath_pmp_6_cfg_x \
		io_dpath_pmp_6_mask \
		io_dpath_pmp_7_addr \
		io_dpath_pmp_7_cfg_a \
		io_dpath_pmp_7_cfg_l \
		io_dpath_pmp_7_cfg_r \
		io_dpath_pmp_7_cfg_w \
		io_dpath_pmp_7_cfg_x \
		io_dpath_pmp_7_mask \
		io_dpath_ptbr_mode \
		io_dpath_ptbr_ppn \
		io_dpath_sfence_bits_addr \
		io_dpath_sfence_bits_rs1 \
		io_dpath_sfence_bits_rs2 \
		io_dpath_status_debug \
		io_dpath_status_dprv \
		io_dpath_status_mxr \
		io_dpath_status_prv \
		io_dpath_status_sum \
		io_mem_resp_bits_data \
		io_mem_s2_nack \
		io_mem_s2_xcpt_ae_ld \
		io_requestor_0_req_bits_bits_addr \
		io_requestor_1_req_bits_bits_addr \
		io_requestor_1_req_bits_bits_need_gpa} \
	-to { io_mem_req_valid \
		io_requestor_0_req_ready \
		io_requestor_0_resp_valid \
		io_requestor_1_req_ready \
		io_requestor_1_resp_valid}

check_spv -prove
