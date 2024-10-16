yosys read_verilog -sv build/rocket-chip/XiangShan.$::env(YOSYS_TOP).$::env(YOSYS_CONFIG).top.opt.v
yosys read_verilog -sv asic/yosys/blackbox.v

yosys hierarchy -top $::env(YOSYS_TOP)

yosys proc
yosys memory_collect
yosys opt -purge

# yosys tee -o build/rocket-chip/sink_summary.log tsink --verbose --top $::env(YOSYS_TOP)

yosys tee -o build/rocket-chip/xiangshan_ift.log    cellift -exclude-signals clk_i,rst_ni,clock,reset,reset_wire_reset -imprecise-shl-sshl -verbose
yosys setattr -mod -set pift_ignore_module 1 XS_L2Top
yosys tee -o build/rocket-chip/xiangshan_cov.log    tcov --verbose

yosys opt -purge

yosys setattr -mod -set pift_ignore_module 0 XS_L2Top

yosys write_verilog -simple-lhs build/rocket-chip/XiangShan.$::env(YOSYS_TOP).$::env(YOSYS_CONFIG).top.ift.v
