+define+RVFI

+incdir+${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl
+incdir+${SRC}/ibex/formal/data_ind_timing
+incdir+${SRC}/ibex/vendor/lowrisc_ip/dv/sv/dv_utils


// IBEX_PKGS
${SRC}/ibex/rtl/ibex_pkg.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_pkg.sv
${SRC}/ibex/dv/uvm/core_ibex/common/prim/prim_pkg.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_pkg.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_cipher_pkg.sv

//IBEX_VSRCS
${SRC}/ibex/rtl/ibex_alu.sv
${SRC}/ibex/rtl/ibex_branch_predict.sv
${SRC}/ibex/rtl/ibex_compressed_decoder.sv
${SRC}/ibex/rtl/ibex_controller.sv
${SRC}/ibex/rtl/ibex_core.sv
${SRC}/ibex/rtl/ibex_counter.sv
${SRC}/ibex/rtl/ibex_cs_registers.sv
${SRC}/ibex/rtl/ibex_csr.sv
${SRC}/ibex/rtl/ibex_decoder.sv
${SRC}/ibex/rtl/ibex_dummy_instr.sv
${SRC}/ibex/rtl/ibex_ex_block.sv
${SRC}/ibex/rtl/ibex_fetch_fifo.sv
${SRC}/ibex/rtl/ibex_icache.sv
${SRC}/ibex/rtl/ibex_id_stage.sv
${SRC}/ibex/rtl/ibex_if_stage.sv
${SRC}/ibex/rtl/ibex_load_store_unit.sv
${SRC}/ibex/rtl/ibex_lockstep.sv
${SRC}/ibex/rtl/ibex_multdiv_fast.sv
${SRC}/ibex/rtl/ibex_multdiv_slow.sv
${SRC}/ibex/rtl/ibex_pmp.sv
${SRC}/ibex/rtl/ibex_prefetch_buffer.sv
${SRC}/ibex/rtl/ibex_register_file_ff.sv
${SRC}/ibex/rtl/ibex_register_file_fpga.sv
${SRC}/ibex/rtl/ibex_register_file_latch.sv
${SRC}/ibex/rtl/ibex_top.sv
${SRC}/ibex/rtl/ibex_wb_stage.sv
${SRC}/ibex/dv/uvm/core_ibex/common/prim/prim_clock_gating.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_clock_gating.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_39_32_enc.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_39_32_dec.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_lfsr.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_28_22_enc.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_28_22_dec.sv
${SRC}/ibex/dv/uvm/core_ibex/common/prim/prim_ram_1p.sv
${SRC}/ibex/dv/uvm/core_ibex/common/prim/prim_buf.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_ram_1p.sv
${SRC}/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_generic_buf.sv

${SRC}/starship/src/main/resources/vsrc/IbexCoreBlackbox.sv