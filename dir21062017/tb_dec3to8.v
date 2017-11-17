module tb_dec3to8;

reg [2:0]a;
reg en;
wire [7:0]y;

dec3to8 DUT(.a(a),.en(en),.y(y));

initial
begin
	en=1'b1;
	#10 a=3'd0;
	#10 a=3'd1;
	#10 a=3'd2;
	#10 a=3'd3;
	#10 a=3'd4;
	#10 a=3'd5;
	#10 a=3'd6;
	#10 a=3'd7;
	
	#10 en=1'b0;
	#10 a=3'd0;
	#10 a=3'd1;
	#10 a=3'd2;
	#10 a=3'd3;
	#10 a=3'd4;
	#10 a=3'd5;
	#10 a=3'd6;
	#10 a=3'd7;
end

initial
$monitor($time,"a=%b,en=%b,y=%b",a,en,y);
endmodule
