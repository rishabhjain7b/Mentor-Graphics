module register
(input clk,
 input e,
 output reg a);

reg b,c,d;

always @ (posedge clk)
begin
	d=e;
	c=d;
	b=c;
	a=b;
end
endmodule
