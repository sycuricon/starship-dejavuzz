`define DUT_ROB_ENQ_EN_0        `DUT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_enq_valids_0
`define DUT_ROB_ENQ_INST_0      `DUT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_enq_uops_0_debug_inst
`define DUT_ROB_ENQ_PC_0        `DUT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_enq_uops_0_debug_pc
`define DUT_ROB_DEQ_EN_0        `DUT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_commit_valids_0
`define DUT_ROB_DEQ_INST_0      `DUT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_commit_uops_0_debug_inst
`define DUT_ROB_DEQ_PC_0        `DUT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_commit_uops_0_debug_pc

`define VNT_ROB_ENQ_EN_0        `VNT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_enq_valids_0
`define VNT_ROB_ENQ_INST_0      `VNT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_enq_uops_0_debug_inst
`define VNT_ROB_DEQ_EN_0        `VNT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_commit_valids_0
`define VNT_ROB_DEQ_INST_0      `VNT_SOC_TOP.tile_prci_domain.tile_reset_domain_boom_tile.core.rob.io_commit_uops_0_debug_inst

`define IS_DUT 1
`define IS_VNT 0

`define EARLY_EXIT_PC 64'h80600000
`define MTVEC_EXIT_PC 64'h80000020
`define STVEC_EXIT_PC 64'h80000060

reg [63:0] last_pc = 0;
reg maybe_deadlock = 0;
reg early_exit = 0;

initial begin
  void'($value$plusargs("early_exit=%d", early_exit));
end

wire can_early_exit;
assign can_early_exit = 
  (`DUT_ROB_ENQ_PC_0 == `EARLY_EXIT_PC)
  & early_exit;
assign tvec_exit = (`DUT_ROB_ENQ_PC_0 == `MTVEC_EXIT_PC)|
  (`DUT_ROB_ENQ_PC_0 == `STVEC_EXIT_PC);
reg [6:0] exit_count = 0;

always @(posedge clock) begin
  if (!reset) begin
    event_handler(`DUT_ROB_ENQ_EN_0, `DUT_ROB_ENQ_INST_0, "ENQ", 0, `IS_DUT);
    event_handler(`DUT_ROB_DEQ_EN_0, `DUT_ROB_DEQ_INST_0, "DEQ", 0, `IS_DUT);

    `ifdef HASVARIANT
      event_handler(`VNT_ROB_ENQ_EN_0, `VNT_ROB_ENQ_INST_0, "ENQ", 0, `IS_VNT);
      event_handler(`VNT_ROB_DEQ_EN_0, `VNT_ROB_DEQ_INST_0, "DEQ", 0, `IS_VNT);
    `endif

    if (`DUT_ROB_DEQ_EN_0) begin
      last_pc <= `DUT_ROB_DEQ_PC_0;
    end

    if (`DUT_ROB_DEQ_EN_0 && `DUT_ROB_DEQ_PC_0 == last_pc) begin
      maybe_deadlock <= 1;
    end
    else if (`DUT_ROB_DEQ_EN_0 && `DUT_ROB_DEQ_PC_0 != last_pc) begin
      maybe_deadlock <= 0;
    end

    if((can_early_exit | maybe_deadlock | tvec_exit) && tsx_done == 1'b0)begin
      tsx_done <= 1'b1;
      if(can_early_exit)begin
        $display("early exit");
      end else if(maybe_deadlock)begin
        $display("may dead loop");
      end else begin
        $display("tvec exit");
      end
    end

    if (`DUT_ROB_DEQ_EN_0 && `DUT_ROB_DEQ_PC_0 == last_pc && tsx_done) begin
      exit_count <= exit_count + 7'b1;
    end

    if(exit_count == 7'h127)begin
      $finish;
    end

  end
end