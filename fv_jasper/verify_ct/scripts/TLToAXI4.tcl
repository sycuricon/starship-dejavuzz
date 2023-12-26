analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top TLToAXI4 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { auto_in_a_bits_address \
		auto_in_a_bits_data \
		auto_in_a_bits_mask \
		auto_in_a_bits_opcode \
		auto_in_a_bits_size \
		auto_in_a_bits_source \
		auto_out_b_bits_echo_tl_state_size \
		auto_out_b_bits_echo_tl_state_source \
		auto_out_b_bits_id \
		auto_out_b_bits_resp \
		auto_out_r_bits_data \
		auto_out_r_bits_echo_tl_state_size \
		auto_out_r_bits_echo_tl_state_source \
		auto_out_r_bits_id \
		auto_out_r_bits_last \
		auto_out_r_bits_resp} \
	-to { auto_in_a_ready \
		auto_in_d_valid \
		auto_out_ar_valid \
		auto_out_aw_valid \
		auto_out_b_ready \
		auto_out_r_ready \
		auto_out_w_valid}

check_spv -prove
