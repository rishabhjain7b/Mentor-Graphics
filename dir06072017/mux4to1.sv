module mux4to1
(input a,b,c,d,
 input [1:0]s,
 output reg y);
 
always @(a,b,c,d,s)
(*full_case*)
begin
	priority case(s)
	2'b00,2'b01: y=a;
	2'b10,2'b11: y=d;
	endcase
end
endmodule
