analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top Queue_22 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_enq_bits_extra_id io_enq_bits_tl_state_size io_enq_bits_tl_state_source} -to {io_deq_valid io_enq_ready}
prove -all