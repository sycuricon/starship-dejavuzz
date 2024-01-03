analyze -sva ./fv_jasper/verilog/TestHarness.v ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top TestHarness -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0

