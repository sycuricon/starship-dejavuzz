analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top BranchKillableQueue_2 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_brupdate_b1_mispredict_mask io_brupdate_b1_resolve_mask io_enq_bits_data io_enq_bits_is_hella io_enq_bits_uop_br_mask io_enq_bits_uop_is_amo io_enq_bits_uop_ldq_idx io_enq_bits_uop_stq_idx io_enq_bits_uop_uses_ldq io_enq_bits_uop_uses_stq io_flush} -to {io_deq_valid io_enq_ready}
prove -all