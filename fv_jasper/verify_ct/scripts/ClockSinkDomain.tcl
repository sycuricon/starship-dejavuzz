analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top ClockSinkDomain -bbox_m StarshipROM

clock -infer
reset -none -non_resettable_regs 0


check_spv -create -from {auto_plic_in_a_bits_address auto_plic_in_a_bits_data auto_plic_in_a_bits_mask auto_plic_in_a_bits_opcode auto_plic_in_a_bits_size auto_plic_in_a_bits_source auto_plic_int_in_0} -to {auto_plic_in_a_ready auto_plic_in_d_valid}
prove -all