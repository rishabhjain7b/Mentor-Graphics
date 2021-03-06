
module alu
(input clock,
 input reset,
 input signed [31:0]aluin1,aluin2,
 input signed [2:0]opselect,operation,
 input signed [4:0]shift_number,
 input enable_arith,
 input enable_shift,
 output signed [31:0]aluout,
 output carryout);
 
 reg signed[31:0]w_aluout_arith;
 reg w_carry;
 reg signed[31:0]w_aluout_shift;
 reg w_carry_shift;
 reg sel;
 
 shift_alu DUT1 (.clock(clock),.reset(reset),.in(aluin1),.shift(shift_number),.shift_operation(operation),.enable(enable_shift),.aluout_shift(w_aluout_shift),.carry_shift(w_carry_shift));
  
 arith_alu DUT2 (.clock(clock),.reset(reset),.aluin1(aluin1),.aluin2(aluin2),.alu_operation(operation),.alu_opselect(opselect),.enable(enable_arith),.aluout_arith(w_aluout_arith),.carry(w_carry));
  
 dff d1 (.clk(clock),.d(enable_arith),.q(sel));
  
 mux x (.in1(w_aluout_shift),.in2(w_aluout_arith),.sel(sel),.out(aluout));
 
 mux1 m (.a(w_carry_shift),.b(w_carry),.s(sel),.y(carryout));
 

endmodule
