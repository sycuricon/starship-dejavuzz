analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top PeripheryBus_1 -bbox_m StarshipROM

clock -infer
reset -none -non_resettable_regs 0


check_spv -create \
	-from { auto_bus_xing_in_a_bits_address \
		auto_bus_xing_in_a_bits_data \
		auto_bus_xing_in_a_bits_mask \
		auto_bus_xing_in_a_bits_opcode \
		auto_bus_xing_in_a_bits_param \
		auto_bus_xing_in_a_bits_size \
		auto_bus_xing_in_a_bits_source \
		auto_coupler_to_MaskROM_fragmenter_out_d_bits_data \
		auto_coupler_to_MaskROM_fragmenter_out_d_bits_size \
		auto_coupler_to_MaskROM_fragmenter_out_d_bits_source \
		auto_coupler_to_bootrom_fragmenter_out_d_bits_data \
		auto_coupler_to_bootrom_fragmenter_out_d_bits_size \
		auto_coupler_to_bootrom_fragmenter_out_d_bits_source \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source \
		auto_coupler_to_clint_fragmenter_out_d_bits_data \
		auto_coupler_to_clint_fragmenter_out_d_bits_opcode \
		auto_coupler_to_clint_fragmenter_out_d_bits_size \
		auto_coupler_to_clint_fragmenter_out_d_bits_source \
		auto_coupler_to_plic_fragmenter_out_d_bits_data \
		auto_coupler_to_plic_fragmenter_out_d_bits_opcode \
		auto_coupler_to_plic_fragmenter_out_d_bits_size \
		auto_coupler_to_plic_fragmenter_out_d_bits_source} \
	-to { auto_bus_xing_in_a_ready \
		auto_bus_xing_in_d_valid \
		auto_coupler_to_MaskROM_fragmenter_out_a_valid \
		auto_coupler_to_MaskROM_fragmenter_out_d_ready \
		auto_coupler_to_bootrom_fragmenter_out_a_valid \
		auto_coupler_to_bootrom_fragmenter_out_d_ready \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid \
		auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready \
		auto_coupler_to_clint_fragmenter_out_a_valid \
		auto_coupler_to_clint_fragmenter_out_d_ready \
		auto_coupler_to_plic_fragmenter_out_a_valid \
		auto_coupler_to_plic_fragmenter_out_d_ready \
		auto_coupler_to_resetmanager_fragmenter_out_a_valid \
		auto_coupler_to_resetmanager_fragmenter_out_d_ready}

check_spv -prove
