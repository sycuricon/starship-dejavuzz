# ----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2021.03
# platform  : Linux 3.10.0-1127.10.1.el7.x86_64
# version   : 2021.03 FCS 64 bits
# build date: 2021.03.23 02:50:43 UTC
# ----------------------------------------
# started   : 2023-12-26 00:33:44 EST
# hostname  : sat4.sat_cluster
# pid       : 119605
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:33056' '-style' 'windows' '-data' 'AAAAnHicPYs9CsJAEEbfkgt4Eq3s0toZBJG0IQkqEYuQFUEbr+pNNm9F8sHM9zcTgPKTUuKH4u1asafiyM59oJYXhO9flCE7p+bCk4YbLZGRMxMbk8yD3cuu52EW5ZyNuqg/+XH1LnPHXdWwZW3b68QMXs8YsQ==' '-proj' '/u/qinhant/starship-parafuzz/jgproject/sessionLogs/session_0' '-init' '-hidden' '/u/qinhant/starship-parafuzz/jgproject/.tmp/.initCmds.tcl' 'fv_jasper/verify_ct/scripts/TageTable_5.tcl'
analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top TageTable_5 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_f1_req_ghist io_f1_req_pc io_update_alloc_0 io_update_alloc_1 io_update_alloc_2 io_update_alloc_3 io_update_hist io_update_mask_0 io_update_mask_1 io_update_mask_2 io_update_mask_3 io_update_old_ctr_0 io_update_old_ctr_1 io_update_old_ctr_2 io_update_old_ctr_3 io_update_pc io_update_taken_0 io_update_taken_1 io_update_taken_2 io_update_taken_3 io_update_u_0 io_update_u_1 io_update_u_2 io_update_u_3 io_update_u_mask_0 io_update_u_mask_1 io_update_u_mask_2 io_update_u_mask_3} -to {io_f3_resp_0_valid io_f3_resp_1_valid io_f3_resp_2_valid io_f3_resp_3_valid}
prove -all
