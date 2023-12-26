# ----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2021.03
# platform  : Linux 3.10.0-1127.10.1.el7.x86_64
# version   : 2021.03 FCS 64 bits
# build date: 2021.03.23 02:50:43 UTC
# ----------------------------------------
# started   : 2023-12-26 00:34:35 EST
# hostname  : sat4.sat_cluster
# pid       : 119778
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:37075' '-style' 'windows' '-data' 'AAAAtHicPY1LCsJAEETf4AU8iV4gq4A7RRFxK2GMfzRkRNCNV/Um8U0QG7qrq6o/ASjeXdfRx+BlGTJlxpKJdc5a/Ef4/JoiZGZe2fFgw4mKRENNy1gl41HvqRe5qyUxa40syVdu7J0rVSvvRA4s7Gu2TuWdm6zsvTMjeeSSf38BEXodww==' '-proj' '/u/qinhant/starship-parafuzz/jgproject/sessionLogs/session_0' '-init' '-hidden' '/u/qinhant/starship-parafuzz/jgproject/.tmp/.initCmds.tcl' 'fv_jasper/verify_ct/scripts/TageBranchPredictorBank.tcl'
analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top TageBranchPredictorBank -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_f0_pc io_f1_ghist io_resp_in_0_f1_0_is_br io_resp_in_0_f1_0_is_jal io_resp_in_0_f1_0_predicted_pc_bits io_resp_in_0_f1_0_taken io_resp_in_0_f1_1_is_br io_resp_in_0_f1_1_is_jal io_resp_in_0_f1_1_predicted_pc_bits io_resp_in_0_f1_1_taken io_resp_in_0_f1_2_is_br io_resp_in_0_f1_2_is_jal io_resp_in_0_f1_2_predicted_pc_bits io_resp_in_0_f1_2_taken io_resp_in_0_f1_3_is_br io_resp_in_0_f1_3_is_jal io_resp_in_0_f1_3_predicted_pc_bits io_resp_in_0_f1_3_taken io_resp_in_0_f2_0_is_br io_resp_in_0_f2_0_is_jal io_resp_in_0_f2_0_predicted_pc_bits io_resp_in_0_f2_0_taken io_resp_in_0_f2_1_is_br io_resp_in_0_f2_1_is_jal io_resp_in_0_f2_1_predicted_pc_bits io_resp_in_0_f2_1_taken io_resp_in_0_f2_2_is_br io_resp_in_0_f2_2_is_jal io_resp_in_0_f2_2_predicted_pc_bits io_resp_in_0_f2_2_taken io_resp_in_0_f2_3_is_br io_resp_in_0_f2_3_is_jal io_resp_in_0_f2_3_predicted_pc_bits io_resp_in_0_f2_3_taken io_resp_in_0_f3_0_predicted_pc_bits io_resp_in_0_f3_0_taken io_resp_in_0_f3_1_predicted_pc_bits io_resp_in_0_f3_1_taken io_resp_in_0_f3_2_predicted_pc_bits io_resp_in_0_f3_2_taken io_resp_in_0_f3_3_predicted_pc_bits io_resp_in_0_f3_3_taken io_update_bits_br_mask io_update_bits_btb_mispredicts io_update_bits_cfi_idx_bits io_update_bits_cfi_mispredicted io_update_bits_cfi_taken io_update_bits_ghist io_update_bits_is_mispredict_update io_update_bits_is_repair_update io_update_bits_meta io_update_bits_pc} -to {io_resp_f1_0_predicted_pc_valid io_resp_f1_1_predicted_pc_valid io_resp_f1_2_predicted_pc_valid io_resp_f1_3_predicted_pc_valid io_resp_f2_0_predicted_pc_valid io_resp_f2_1_predicted_pc_valid io_resp_f2_2_predicted_pc_valid io_resp_f2_3_predicted_pc_valid io_resp_f3_0_predicted_pc_valid io_resp_f3_1_predicted_pc_valid io_resp_f3_2_predicted_pc_valid io_resp_f3_3_predicted_pc_valid}
prove -all
