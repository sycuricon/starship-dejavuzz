analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top MemoryBus -bbox_m StarshipROM

clock -infer
reset -none -non_resettable_regs 0


check_spv -create \
	-from { auto_bus_xing_in_a_bits_address \
		auto_bus_xing_in_a_bits_data \
		auto_bus_xing_in_a_bits_mask \
		auto_bus_xing_in_a_bits_opcode \
		auto_bus_xing_in_a_bits_size \
		auto_bus_xing_in_a_bits_source \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp} \
	-to { auto_bus_xing_in_a_ready \
		auto_bus_xing_in_d_valid \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready \
		auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid}

check_spv -prove
