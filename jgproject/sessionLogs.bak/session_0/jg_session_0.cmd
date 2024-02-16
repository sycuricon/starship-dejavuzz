# ----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2021.03
# platform  : Linux 3.10.0-1127.10.1.el7.x86_64
# version   : 2021.03 FCS 64 bits
# build date: 2021.03.23 02:50:43 UTC
# ----------------------------------------
# started   : 2024-02-15 12:25:51 EST
# hostname  : sat4.sat_cluster
# pid       : 196619
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:45819' '-style' 'windows' '-data' 'AAAArHicPYy9CgIxEIS/4Av4InqF7bV2imBhexxB4cQ/Lmph46v6JvFLECfMbmZmdwPQvnPOVExelikr1mxZWjfs7H+Ez+/ThqLkwfek40hP4saekYaBi7zLnpNpyRIPzk4U92re6ESnh+qlqst+VI32mXcXzFXRG+ILNiUcYQ==' '-proj' '/u/qinhant/starship-parafuzz/jgproject/sessionLogs/session_0' '-init' '-hidden' '/u/qinhant/starship-parafuzz/jgproject/.tmp/.initCmds.tcl' 'fv_jasper/initial_assumption/scripts/spectre-v3.tcl'
analyze -sva ./fv_jasper/verilog/TestHarness.v ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top TestHarness -bbox_m StarshipRom -bbox_a 8388608 -bbox_mul 512
