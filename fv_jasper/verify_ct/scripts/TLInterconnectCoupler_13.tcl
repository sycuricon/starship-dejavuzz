analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top TLInterconnectCoupler_13 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { auto_axi4yank_out_b_bits_id \
		auto_axi4yank_out_b_bits_resp \
		auto_axi4yank_out_r_bits_data \
		auto_axi4yank_out_r_bits_id \
		auto_axi4yank_out_r_bits_last \
		auto_axi4yank_out_r_bits_resp \
		auto_tl_in_a_bits_address \
		auto_tl_in_a_bits_data \
		auto_tl_in_a_bits_mask \
		auto_tl_in_a_bits_opcode \
		auto_tl_in_a_bits_size \
		auto_tl_in_a_bits_source \
		auto_tl_out_d_bits_corrupt \
		auto_tl_out_d_bits_data \
		auto_tl_out_d_bits_denied \
		auto_tl_out_d_bits_opcode \
		auto_tl_out_d_bits_size \
		auto_tl_out_d_bits_source \
		auto_widget_in_a_bits_address \
		auto_widget_in_a_bits_data \
		auto_widget_in_a_bits_mask \
		auto_widget_in_a_bits_opcode \
		auto_widget_in_a_bits_size \
		auto_widget_in_a_bits_source} \
	-to { auto_axi4yank_out_ar_valid \
		auto_axi4yank_out_aw_valid \
		auto_axi4yank_out_b_ready \
		auto_axi4yank_out_r_ready \
		auto_axi4yank_out_w_valid \
		auto_tl_in_a_ready \
		auto_tl_in_d_valid \
		auto_tl_out_a_valid \
		auto_tl_out_d_ready \
		auto_widget_in_a_ready \
		auto_widget_in_d_valid}

check_spv -prove
