module test;
logic [1:0]a,b;
initial
begin
	a=2'b1x;
	b=2'b1x;
	if (a==b)
	$display("yes");
	else
	$display("no");
	
	if (a===b)
	$display("yes");
	else
	$display("no");
end 
endmodule
