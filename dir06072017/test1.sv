module test1
(input clk);
bit [3:0]a=4'b0001;
bit [3:0]b=4'b1111;

always @(posedge clk)
fork
	a<=b;
	b<=a;
join
endmodule
