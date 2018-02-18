// executive preprocessor stage 1

`define CLK_PERIOD 10

`define REGISTER_WIDTH 32
`define INSTR_WIDTH 32
`define IMMEDIATE_WIDTH 16

`define MEM_READ 3'b101
`define MEM_WRITE 3'b100
`define ARITH_LOGIC 3'b001
`define SHIFT_REG 3'b000

// ARITHMETIC 
`define ADD 3'b000
`define HADD 3'b001
`define SUB 3'b010
`define NOT 3'b011
`define AND 3'b100
`define OR 3'b101
`define XOR 3'b110
`define LHG 3'b111
 
// SHIFTING 
`define SHLEFTLOG 3'b000
`define SHLEFTART 3'b001
`define SHRGHTLOG 3'b010
`define SHRGHTART 3'b011
 
// DATA TRANSFER 

`define LOADBYTE 3'b000 
`define LOADBYTEU 3'b100 
`define LOADHALF 3'b001
`define LOADHALFU 3'b101 
`define LOADWORD 3'b011


module shift_alu
(input clock,
 input reset,enable,
 input signed [31:0]in,
 input signed [2:0]shift_operation,
 input signed [4:0]shift,
 output signed [31:0]aluout_shift,
 output carry_shift);
 
 reg signed [31:0]w_aluout_shift;
 reg w_carry_shift;
 
 assign aluout_shift=w_aluout_shift,
 	carry_shift=w_carry_shift;
 
 function [31:0]rghtarth
 (input [31:0]f_in,
  input [4:0]f_shift);
  	f_in=f_in>>shift;
  	rghtarth=({32{1'b1}}<<(32-shift))|(f_in>>shift);
  	//(in[31])?({1'b0,((in>>shift)|{{(shift){1'b1}},{(32-shift){1'b0}}})}):(in>>shift)
  endfunction
  	
always @(posedge clock,negedge reset)
begin
	if(!reset)
	begin
		w_aluout_shift<=0;
		w_carry_shift<=0;
	end
	
	else
	begin
		if(!enable)
		begin
			w_aluout_shift<=w_aluout_shift;
			w_carry_shift<=w_carry_shift;
		end
		else
		begin
			case(shift_operation[2:0])
			`SHLEFTLOG: {w_carry_shift,w_aluout_shift}<={1'b0,(in<<shift)};
			`SHLEFTART: begin
					w_aluout_shift<=(in<<shift);
					w_carry_shift<=(in[31]==1)?1:0;
				    end

			`SHRGHTLOG: {w_carry_shift,w_aluout_shift}<={1'b0,(in>>shift)};
			`SHRGHTART: begin
					w_carry_shift<=0;
					w_aluout_shift<=(in[31])?rghtarth(in,shift):(in>>shift);
				    end
			default: {w_carry_shift,w_aluout_shift}<={w_carry_shift,w_aluout_shift};
			endcase
		end
	end
end
endmodule
