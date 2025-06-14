yosys read_verilog -sv build/rocket-chip/XiangShan.$::env(YOSYS_TOP).$::env(YOSYS_CONFIG).top.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/XSTop.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_0_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_10_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_11_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_12_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_13_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_14_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_15_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_16_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_17_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_18_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_19_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_1_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_20_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_21_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_22_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_23_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_24_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_25_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_26_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_2_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_3_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_4_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_5_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_6_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_7_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_8_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_9_ext.v
yosys read_verilog -sv $::env(XS_REPO_DIR)/build/rtl/array_0_ext.v
yosys read_verilog -sv asic/yosys/blackbox.v
yosys read_verilog -sv build/rocket-chip/XiangShan.$::env(YOSYS_TOP).$::env(YOSYS_CONFIG).behav_srams.top.v

yosys hierarchy -top $::env(YOSYS_TOP)

yosys tee -o build/rocket-chip/xiangshan_keep.log keep_chisel_signals --verbose

yosys proc
yosys pmuxtree
yosys bmuxmap
yosys opt -purge

yosys write_verilog -simple-lhs build/rocket-chip/XiangShan.$::env(YOSYS_TOP).$::env(YOSYS_CONFIG).top.opt.v
