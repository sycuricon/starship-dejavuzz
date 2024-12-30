yosys read_verilog -sv build/rocket-chip/BOOM.$::env(YOSYS_TOP).$::env(YOSYS_CONFIG).top.opt.v
yosys read_verilog -sv asic/yosys/blackbox.v

yosys hierarchy -top $::env(YOSYS_TOP)

yosys proc
yosys opt -purge

yosys tee -o build/rocket-chip/boom_ift.log     cellift -exclude-signals clk_i,rst_ni,clock,reset,reset_wire_reset -imprecise-shl-sshl -verbose
yosys tee -o build/rocket-chip/boom_cov.log     tcov --verbose

yosys opt -purge

yosys write_verilog -simple-lhs build/rocket-chip/BOOM.$::env(YOSYS_TOP).$::env(YOSYS_CONFIG).top.ift.v
