//test bench using for machine which makes A=1 for consecutive 4 0s, B=1 for consecutive 4 1s

module tb_mach_det;
reg clk,rst,x;
wire A,B;

mach_det DUT (.clk(clk),.rst(rst),.x(x),.A(A),.B(B));
integer fd,i;

initial
fd=$fopen("mach_det.txt");

initial
clk=1'b0;
always
#5 clk=~clk;

initial
begin
	rst=0;
	#12 rst=1;
	//#80 rst=0;
	//#60 rst=1;
end

initial
begin
	x=0;
	#4 x=1;
	#10 x=1;
	#10 x=0;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	/*#10 x=0;
	#10 x=0;
	#10 x=1;
	#10 x=0;
	#10 x=0;
	#10 x=0;*/
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	/*#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=0;
	#10 x=1;
	#10 x=0;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;*/
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
	#10 x=1;
end

initial
$fmonitor(fd,$time," clk=%b rst=%b  x=%b  A=%b B=%b ",clk,rst,x,A,B);

endmodule 
