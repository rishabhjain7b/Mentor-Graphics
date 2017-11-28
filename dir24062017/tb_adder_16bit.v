//test bench using random for 16 bit adder

module tb_adder_16bit;
reg [15:0]a,b;
wire [16:0]s;

adder_16bit f1(.a(a),.b(b),.s(s));
integer fd,i;

initial
fd=$fopen("adder_16bit.txt");

initial
begin
	repeat(10)
	begin
		a=$random();
		b=$random();
		#10;
		if ((a+b)==s)
		$fdisplay(fd,$time," no error");
	end
end

initial
$fmonitor(fd,$time," a=%d b=%d  s=%d ",a,b,s);

endmodule 
