//  nested module eXAMPLE

module tb_counter;

	module counter
	(input clk,rst,
	output reg[3:0]q);
	
	always @(posedge clk)
	begin
		if(!rst)
		q<=0;
		else
		q<=q+1;
	end
	endmodule

bit clk,rst;
logic [3:0]q;

counter c (.*);

always #5 clk++;

initial
begin
	rst=0;
	#25 rst=1;
	#50 rst=0;
	#255 rst=1;
end
endmodule
	
