analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top Queue_69 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create -from {io_enq_bits_data io_enq_bits_extra_tlrr_extra_size io_enq_bits_extra_tlrr_extra_source io_enq_bits_index io_enq_bits_mask io_enq_bits_read} -to {io_deq_valid io_enq_ready}
prove -all