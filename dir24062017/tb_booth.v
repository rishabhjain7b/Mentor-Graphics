// Testbench for booth multiplier of 4-bit number, RADIX 2

module tb_booth;
 reg signed [3:0]a,b;
 reg clk,rst;
 wire signed [7:0]y;

 booth dut (.a(a),.b(b),.clk(clk),.rst(rst),.y(y));
 
 initial
 begin
 	clk=1'b0;
 	rst=1'b0;
 end
 
 always #5 clk=~clk;
 
 initial
 begin
 	#10;
 	a=4'b0010;
 	b=4'b0101;
	rst=1'b0; 	
 	#10 rst=1'b1;
 	
 	#50;
 	a=4'b0110;
 	b=4'b0101;
	rst=1'b0; 	
 	#10 rst=1'b1;

	#50;
 	a=4'b1010;
 	b=4'b0101;
	rst=1'b0; 	
 	#10 rst=1'b1;

	#50;
 	a=4'b1010;
 	b=4'b1101;
	rst=1'b0; 	
 	#10 rst=1'b1;

	#50;
 	a=4'b0010;
 	b=4'b1101;
	rst=1'b0; 	
 	#10 rst=1'b1;

 end
 
 initial
 $monitor($time," a=%d,b=%d,y=%d,rst=%b ",a,b,y,rst);
 
 endmodule
