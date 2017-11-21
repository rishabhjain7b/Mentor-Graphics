module tb_dff_rst;

reg d,clk,rst;
wire q;

dff_rst_async d1 (.d(d),.clk(clk),.rst(rst),.q(q));

initial
	clk=1'b0;
always
	#5 clk=~clk;

initial
begin
	rst = 1'b0;
	#10 rst=1'b1;
	#40 rst=1'b0;
end

initial
begin
	d=1'b0;
	#10 d=1'b1;
	#7 d=1'b0;
	#23 d=1'b1;
	#47 d=1'b0;
end

initial
$monitor($time,"clk=%b,d=%b,rst=%b,q=%b",clk,d,rst,q);
endmodule
