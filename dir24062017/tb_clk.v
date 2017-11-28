// test bench for clock generation

module tb_clk;
reg clk;

initial
begin
	clk=1'b0;
	for(;;)
	#5 clk=~clk;
end

initial
#200 $stop;

endmodule
