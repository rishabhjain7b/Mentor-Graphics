// sequence with edge definition

module test1;
bit clk;
bit a,b;
/*
always @(posedge clk)
begin
	a=1;
	#10 a=0;
end */
	
assert property(@(posedge clk) $rose(a) |-> ##1 $rose(b))
	$display("pass"); 
else
$info("fail");

endmodule
