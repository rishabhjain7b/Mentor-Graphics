module mod_pgm_test;
bit clk;
duv di(clk);
bench bi(clk);
initial
begin
	for(int i=0;i<17;i++)
	#1 clk=~clk;
end

always @(posedge clk)
di.siga<=di.sigb;
always @(negedge clk)
$strobe("time=%2d\tsiga=%0b\tsigb=%0b",$time,di.siga,di.sigb);

endmodule
