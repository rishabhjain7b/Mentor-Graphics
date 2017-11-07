// binary 2bit multiplier

module mul2x2
(input [1:0]a,b,
 output [3:0]y);

wire [1:0]c;
assign y[0]= a[0] & b[0],
	{c[0],y[1]}= (a[1]&b[0])+(a[0]&b[1]),
	{c[1],y[2]}= (a[1]&b[1])+c[0],
	y[3]=c[1];
	
endmodule
