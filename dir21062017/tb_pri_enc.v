module tb_pri_enc;

reg [3:0]a;
wire [1:0]y;

pri_enc DUT(.a(a),.y(y));

initial
begin
	   a=4'b0000;
	#10a=4'b0001;
	#10a=4'b0010;
	#10a=4'b01xx;
	#10a=4'b0011;
	#10a=4'b0100;
	#10a=4'b0101;
	#10a=4'b1xxx;
	#10a=4'b0110;
	#10a=4'b0111;
        #10a=4'b1000;
	#10a=4'b1001;
	#10a=4'b1010;
	#10a=4'b1011;
	#10a=4'b011x;
	#10a=4'b1100;
	#10a=4'b1101;
	#10a=4'b1110;
	#10a=4'b1111;
	#10a=4'bxxxz;

end

initial
$monitor($time,"a=%b y=%b",a,y);
endmodule

