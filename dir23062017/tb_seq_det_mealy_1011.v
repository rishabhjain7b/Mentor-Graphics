// test bench mealy machine for detecting 1011

module tb_seq_det_mealy_1011;
reg clk,rst,x;
wire y;
 
seq_det_mealy_1011 m1(.clk(clk),.rst(rst),.x(x),.y(y));

initial
clk=1'b0;
always 
#5 clk=~clk;

initial
begin
	rst=1'b0;
	#12 rst=1'b1;
	#30 rst=1'b0;
	#10 rst=1'b1;
end

initial
begin
	x=1'b0;
	#5 x=1'b1;
	#10 x=1'b1;
	#10 x=1'b0;
	#10 x=1'b0;
	#10 x=1'b1;
	#10 x=1'b0;
	#10 x=1'b1;
	#10 x=1'b1;
	#10 x=1'b0;
	#10 x=1'b1;
	#10 x=1'b0;
	#10 x=1'b1;
	#10 x=1'b1;
	#10 x=1'b0;
	#10 x=1'b1;

end

initial
$monitor($time,"clk=%b,rst=%b,x=%b,y=%b",clk,rst,x,y);

initial
#300 $stop;

endmodule

