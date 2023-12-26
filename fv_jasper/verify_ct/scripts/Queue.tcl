analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top Queue -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_enq_bits_address \
		io_enq_bits_data \
		io_enq_bits_mask \
		io_enq_bits_opcode \
		io_enq_bits_param \
		io_enq_bits_size \
		io_enq_bits_source} \
	-to { io_deq_valid \
		io_enq_ready}

check_spv -prove
