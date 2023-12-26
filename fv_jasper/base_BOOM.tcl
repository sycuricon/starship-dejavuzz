analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top StarshipSimTop -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0

