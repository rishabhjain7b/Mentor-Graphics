module tb_bcdto7seg;

reg [3:0]a;
wire [6:0]y;

bcdto7seg DUT(.a(a),.y(y));

initial
begin
	a=4'd0;
	#10a=4'd1;
	#10a=4'd2;
	#10a=4'd3;
	#10a=4'd4;
	#10a=4'd11;
	#10a=4'd5;
	#10a=4'd6;
	#10a=4'd7;
	#10a=4'd8;
	#10a=4'd9;
	#10a=4'bxxxx;
	#10a=4'd15;
end

initial
$monitor($time,"a=%b y=%b",a,y);
endmodule
