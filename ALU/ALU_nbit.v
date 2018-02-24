// N Bit ALU - 8 Operations

module ALU_nbit #(parameter n=4)
(input [n-1:0]a,b,
input [2:0]sel,
output reg [n-1:0]o,
output reg co);

parameter ADD=3'd0,
	SUB=3'd1,
	INR=3'd2,
	DCR=3'd3,
	AND=3'd4,
	OR=3'd5,
	XOR=3'd6,
	CMP=3'd7;

always @(a,b,sel)
   begin
	case(sel)
		ADD: {co,o} = a+b;
		SUB: {co,o} = a-b;
		INR: {co,o} = a+1'b1;
		DCR: {co,o} = b-1'b1;
		AND:begin 
			co=1'b0;
			o=a&b;
			end
		OR:begin 
			co=1'b0;
			o=a|b;
			end
		XOR:begin 
			co=1'b0;
			o=a^b;
			end
		CMP:begin 
			co=1'b0;
			o=~b;
			end
		default: {co,o}={(n+1){1'bx}};
	endcase
   end

endmodule
