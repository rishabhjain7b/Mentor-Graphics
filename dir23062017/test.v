module test
(input a,b,
 output reg y);
 
always @(a,b)
	#0 y=a&b;
always @(a,b)
	y=a|b;

endmodule
