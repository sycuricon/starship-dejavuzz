analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top BoomTile -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { auto_buffer_out_b_bits_address \
		auto_buffer_out_b_bits_param \
		auto_buffer_out_b_bits_size \
		auto_buffer_out_b_bits_source \
		auto_buffer_out_d_bits_data \
		auto_buffer_out_d_bits_opcode \
		auto_buffer_out_d_bits_param \
		auto_buffer_out_d_bits_sink \
		auto_buffer_out_d_bits_size \
		auto_buffer_out_d_bits_source \
		auto_hartid_in \
		auto_int_local_in_0_0 \
		auto_int_local_in_1_0 \
		auto_int_local_in_1_1 \
		auto_int_local_in_2_0 \
		auto_int_local_in_3_0} \
	-to { auto_buffer_out_a_valid \
		auto_buffer_out_b_ready \
		auto_buffer_out_c_valid \
		auto_buffer_out_d_ready \
		auto_buffer_out_e_valid}

check_spv -prove
