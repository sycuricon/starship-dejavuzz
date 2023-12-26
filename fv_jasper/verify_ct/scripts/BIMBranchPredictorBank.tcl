analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top BIMBranchPredictorBank -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_f0_pc \
		io_resp_in_0_f1_0_is_br \
		io_resp_in_0_f1_0_is_jal \
		io_resp_in_0_f1_0_predicted_pc_bits \
		io_resp_in_0_f1_0_taken \
		io_resp_in_0_f1_1_is_br \
		io_resp_in_0_f1_1_is_jal \
		io_resp_in_0_f1_1_predicted_pc_bits \
		io_resp_in_0_f1_1_taken \
		io_resp_in_0_f1_2_is_br \
		io_resp_in_0_f1_2_is_jal \
		io_resp_in_0_f1_2_predicted_pc_bits \
		io_resp_in_0_f1_2_taken \
		io_resp_in_0_f1_3_is_br \
		io_resp_in_0_f1_3_is_jal \
		io_resp_in_0_f1_3_predicted_pc_bits \
		io_resp_in_0_f1_3_taken \
		io_resp_in_0_f2_0_is_br \
		io_resp_in_0_f2_0_is_jal \
		io_resp_in_0_f2_0_predicted_pc_bits \
		io_resp_in_0_f2_1_is_br \
		io_resp_in_0_f2_1_is_jal \
		io_resp_in_0_f2_1_predicted_pc_bits \
		io_resp_in_0_f2_2_is_br \
		io_resp_in_0_f2_2_is_jal \
		io_resp_in_0_f2_2_predicted_pc_bits \
		io_resp_in_0_f2_3_is_br \
		io_resp_in_0_f2_3_is_jal \
		io_resp_in_0_f2_3_predicted_pc_bits \
		io_resp_in_0_f3_0_predicted_pc_bits \
		io_resp_in_0_f3_1_predicted_pc_bits \
		io_resp_in_0_f3_2_predicted_pc_bits \
		io_resp_in_0_f3_3_predicted_pc_bits \
		io_update_bits_br_mask \
		io_update_bits_btb_mispredicts \
		io_update_bits_cfi_idx_bits \
		io_update_bits_cfi_is_br \
		io_update_bits_cfi_is_jal \
		io_update_bits_cfi_taken \
		io_update_bits_is_mispredict_update \
		io_update_bits_is_repair_update \
		io_update_bits_meta \
		io_update_bits_pc} \
	-to { io_resp_f1_0_predicted_pc_valid \
		io_resp_f1_1_predicted_pc_valid \
		io_resp_f1_2_predicted_pc_valid \
		io_resp_f1_3_predicted_pc_valid \
		io_resp_f2_0_predicted_pc_valid \
		io_resp_f2_1_predicted_pc_valid \
		io_resp_f2_2_predicted_pc_valid \
		io_resp_f2_3_predicted_pc_valid \
		io_resp_f3_0_predicted_pc_valid \
		io_resp_f3_1_predicted_pc_valid \
		io_resp_f3_2_predicted_pc_valid \
		io_resp_f3_3_predicted_pc_valid}

check_spv -prove
