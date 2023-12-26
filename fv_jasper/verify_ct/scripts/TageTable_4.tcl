analyze -sva ./fv_jasper/verilog/BOOM.v ./fv_jasper/verilog/BOOM_mem.v ./fv_jasper/verilog/plusarg_reader.v ./asic/sim/parafuzz.sv

check_spv -init

elaborate -top TageTable_4 -bbox_m StarshipROM

clock clock
reset reset -non_resettable_regs 0


check_spv -create \
	-from { io_f1_req_ghist \
		io_f1_req_pc \
		io_update_alloc_0 \
		io_update_alloc_1 \
		io_update_alloc_2 \
		io_update_alloc_3 \
		io_update_hist \
		io_update_mask_0 \
		io_update_mask_1 \
		io_update_mask_2 \
		io_update_mask_3 \
		io_update_old_ctr_0 \
		io_update_old_ctr_1 \
		io_update_old_ctr_2 \
		io_update_old_ctr_3 \
		io_update_pc \
		io_update_taken_0 \
		io_update_taken_1 \
		io_update_taken_2 \
		io_update_taken_3 \
		io_update_u_0 \
		io_update_u_1 \
		io_update_u_2 \
		io_update_u_3 \
		io_update_u_mask_0 \
		io_update_u_mask_1 \
		io_update_u_mask_2 \
		io_update_u_mask_3} \
	-to { io_f3_resp_0_valid \
		io_f3_resp_1_valid \
		io_f3_resp_2_valid \
		io_f3_resp_3_valid}

check_spv -prove
