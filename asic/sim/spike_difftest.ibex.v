// commit & judge stage

    if (`PIPELINE.rvfi_valid) begin
        if (cosim_commit(0, $signed(`PIPELINE.rvfi_pc_rdata), `PIPELINE.rvfi_trap) != 0) begin
            $display("[CJ] %d Commit Failed", 0);
            #10 $fatal;
        end

        if (`PIPELINE.rf_we_wb_o) begin
            if (cosim_judge(0, "int", `PIPELINE.rvfi_rd_addr, `PIPELINE.rvfi_rd_wdata) != 0) begin
                $display("[CJ] %d integer register Judge Failed", 0);
                #10 $fatal;
            end
        end


    end

// exception & interrupt
    // if (`PIPELINE.rvfi_valid & `PIPELINE.rvfi_trap & `PIPELINE.commit_instr_id_commit[i].ex.cause[63]) begin
    //     cosim_raise_trap(0, `PIPELINE.commit_instr_id_commit[i].ex.cause);
    // end
