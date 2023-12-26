analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top StarshipSimTop -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { l2_frontend_bus_axi4_0_ar_bits_addr \
		l2_frontend_bus_axi4_0_ar_bits_burst \
		l2_frontend_bus_axi4_0_ar_bits_cache \
		l2_frontend_bus_axi4_0_ar_bits_id \
		l2_frontend_bus_axi4_0_ar_bits_len \
		l2_frontend_bus_axi4_0_ar_bits_lock \
		l2_frontend_bus_axi4_0_ar_bits_prot \
		l2_frontend_bus_axi4_0_ar_bits_qos \
		l2_frontend_bus_axi4_0_ar_bits_size \
		l2_frontend_bus_axi4_0_aw_bits_addr \
		l2_frontend_bus_axi4_0_aw_bits_burst \
		l2_frontend_bus_axi4_0_aw_bits_cache \
		l2_frontend_bus_axi4_0_aw_bits_id \
		l2_frontend_bus_axi4_0_aw_bits_len \
		l2_frontend_bus_axi4_0_aw_bits_lock \
		l2_frontend_bus_axi4_0_aw_bits_prot \
		l2_frontend_bus_axi4_0_aw_bits_qos \
		l2_frontend_bus_axi4_0_aw_bits_size \
		l2_frontend_bus_axi4_0_w_bits_data \
		l2_frontend_bus_axi4_0_w_bits_last \
		l2_frontend_bus_axi4_0_w_bits_strb \
		mem_axi4_0_b_bits_id \
		mem_axi4_0_b_bits_resp \
		mem_axi4_0_r_bits_data \
		mem_axi4_0_r_bits_id \
		mem_axi4_0_r_bits_last \
		mem_axi4_0_r_bits_resp \
		uart_0_rxd} \
	-to { l2_frontend_bus_axi4_0_ar_ready \
		l2_frontend_bus_axi4_0_aw_ready \
		l2_frontend_bus_axi4_0_b_valid \
		l2_frontend_bus_axi4_0_r_valid \
		l2_frontend_bus_axi4_0_w_ready \
		mem_axi4_0_ar_valid \
		mem_axi4_0_aw_valid \
		mem_axi4_0_b_ready \
		mem_axi4_0_r_ready \
		mem_axi4_0_w_valid}

check_spv -prove
