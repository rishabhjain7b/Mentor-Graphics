// test bench file for counter

module tb_count;
logic clk,reset,t;
logic [3:0]count;

count c1 (clk,reset,count,t);

bind count:c1 count_assert c_a (clk,reset,count,t);

always #5 clk=!clk;

initial
begin
	clk=0;
	reset=0;
	#15 reset=1;
	#115 reset=0;
	#170 reset=1;
	#200 $stop;
end
endmodule
