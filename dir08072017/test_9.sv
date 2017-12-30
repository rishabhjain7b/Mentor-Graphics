module test_9;
integer out1,out2;
intger f=10,g=-5;
reg signed [15:0]m=10;

initial
begin
	out1=f/g;
	out2=$signed(m)/g;
end
initial
$monitor($time,"out1=%b out2=%b m=%b g=%b,out1,out2,m,g);
endmodule
