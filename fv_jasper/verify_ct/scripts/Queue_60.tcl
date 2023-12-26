analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top Queue_60 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_enq_bits_data \
		io_enq_bits_fsrc \
		io_enq_bits_ghist_current_saw_branch_not_taken \
		io_enq_bits_ghist_new_saw_branch_not_taken \
		io_enq_bits_ghist_new_saw_branch_taken \
		io_enq_bits_ghist_old_history \
		io_enq_bits_ghist_ras_idx \
		io_enq_bits_mask \
		io_enq_bits_pc \
		io_enq_bits_xcpt_ae_inst \
		io_enq_bits_xcpt_pf_inst} \
	-to { io_deq_valid \
		io_enq_ready}

check_spv -prove
