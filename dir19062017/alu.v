module alu#(parameter n=4)
( input [n-1:0]a,b,
  input [2:0]sel,
  output [n:0]s);

assign s=(sel==3'b000)?a+b:
	(sel==3'b001)?a-b:
	(sel==3'b010)?a+1'b1:
	(sel==3'b011)?b-1'b1:
	(sel==3'b100)?{1'b0,a&b}:
	(sel==3'b101)?{1'b0,a|b}:
	(sel==3'b110)?{1'b0,a^b}:{1'b0,~b};
endmodule
