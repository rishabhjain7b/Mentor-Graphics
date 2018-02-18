
module top_dut
(input clock,
 input reset,enable_ex,
 input signed [31:0]src1,src2,imm,mem_data_read_in,
 input signed [6:0]control_in,
 output signed [31:0]aluout,mem_data_write_out,
 output carry,mem_data_wr_en);
 
 reg signed[31:0]w_aluin1,w_aluin2;
 reg [2:0]w_operation_out,w_opselect_out;
 reg signed[4:0]w_shift_number;
 reg w_enable_shift,w_enable_arith;
 
 preprocessor DUT1 (.clock(clock),.reset(reset),.enable_ex(enable_ex),.src1(src1),.src2(src2),.control_in(control_in),.mem_data_read_in(mem_data_read_in),.imm(imm),.mem_data_write_out(mem_data_write_out),.mem_data_wr_en(mem_data_wr_en),.aluin1(w_aluin1),.aluin2(w_aluin2),.operation_out(w_operation_out),.opselect_out(w_opselect_out),.shift_number(w_shift_number),.enable_arith(w_enable_arith),.enable_shift(w_enable_shift));
  
 alu DUT2 (.clock(clock),.reset(reset),.aluin1(w_aluin1),.aluin2(w_aluin2),.operation(w_operation_out),.opselect(w_opselect_out),.shift_number(w_shift_number),.enable_arith(w_enable_arith),.enable_shift(w_enable_shift),.aluout(aluout),.carryout(carry));

endmodule
