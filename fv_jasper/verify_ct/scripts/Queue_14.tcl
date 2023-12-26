analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top Queue_14 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_enq_bits_addr \
		io_enq_bits_burst \
		io_enq_bits_echo_extra_id \
		io_enq_bits_id \
		io_enq_bits_len \
		io_enq_bits_size} \
	-to { io_deq_valid \
		io_enq_ready}

check_spv -prove
