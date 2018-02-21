// N bit ALU- 8 operations

module alu #(parameter n=4)
(input [n-1:0]a,b,
 input [2:0]sel,
 output reg [n-1:0]s,
 output reg co);

parameter ADD=3'b000,
	  SUB=3'b001,
	  INR=3'b010,
	  DCR=3'b011,
	  AND=3'b100,
	  OR=3'b101,
	  XOR=3'b110,
	  CMP=3'b111;

always @ (a,b,sel)
begin
	case(sel)
	ADD: {co,s}=a+b;
	SUB: {co,s}=a-b;
	INR: {co,s}=a+1'b1;
	DCR: {co,s}=a-1'b1;
	AND: begin
		co=1'b0;
		s=a&b;
	     end
	OR: begin
		co=1'b0;
		s=a|b;
	     end	
	XOR: begin
		co=1'b0;
		s=a^b;
	     end	
	CMP: {co,s}={1'b0,~b};
	//default: {co,s}={(n+1){1'bx}};
	endcase
end
endmodule	
