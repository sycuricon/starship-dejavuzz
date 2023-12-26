analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top Queue_62 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_enq_bits_btb_mispredicts \
		io_enq_bits_ghist_old_history \
		io_enq_bits_meta_0 \
		io_enq_bits_pc} \
	-to { io_deq_bits_cfi_idx_valid \
		io_deq_valid \
		io_enq_ready}

check_spv -prove
