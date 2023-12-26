analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top BoomDuplicatedDataArray -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_read_0_bits_addr io_read_0_bits_way_en io_write_bits_addr io_write_bits_data io_write_bits_way_en io_write_bits_wmask} -to {}
prove -all