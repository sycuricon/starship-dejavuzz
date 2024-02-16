analyze -sva ./fv_jasper/verilog/TestHarness.v ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

elaborate -top TestHarness -bbox_m StarshipROM -bbox_a 8388608 -bbox_mul 512

clock clock
reset reset -non_resettable_regs 0

check_spv -create -from {ldut.tile_prci_domain.tile_reset_domain_boom_tile.dcache.data.array_1_0.array_0_0_ext.ram} -to {ldut.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_commit_valids_0}

set_prove_orchestration off
set_engine_mode {Ht J U B}
