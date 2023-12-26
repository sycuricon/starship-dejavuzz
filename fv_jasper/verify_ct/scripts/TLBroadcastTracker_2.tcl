analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top TLBroadcastTracker_2 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_d_last \
		io_e_last \
		io_in_a_bits_address \
		io_in_a_bits_data \
		io_in_a_bits_mask \
		io_in_a_bits_opcode \
		io_in_a_bits_size \
		io_in_a_bits_source \
		io_in_a_first \
		io_probe_bits_count \
		io_probedack \
		io_probenack \
		io_probesack} \
	-to { io_in_a_ready \
		io_out_a_valid}

check_spv -prove
