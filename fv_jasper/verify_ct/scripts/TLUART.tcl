analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top TLUART -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { auto_control_xing_in_a_bits_address \
		auto_control_xing_in_a_bits_data \
		auto_control_xing_in_a_bits_mask \
		auto_control_xing_in_a_bits_opcode \
		auto_control_xing_in_a_bits_size \
		auto_control_xing_in_a_bits_source \
		auto_io_out_rxd} \
	-to { auto_control_xing_in_a_ready \
		auto_control_xing_in_d_valid}

check_spv -prove
