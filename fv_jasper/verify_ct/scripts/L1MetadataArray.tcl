analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top L1MetadataArray -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_read_bits_idx io_write_bits_data_coh_state io_write_bits_data_tag io_write_bits_idx io_write_bits_way_en} -to {io_read_ready io_write_ready}
prove -all