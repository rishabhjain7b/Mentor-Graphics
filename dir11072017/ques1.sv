
class test;
rand reg [5:0]a,b;
endclass

module ques1;
test t1=new();
initial
begin
	repeat(5)
	begin
	if(t1.randomize())
	$display("%p",t1);
	else
	$display("randomization failed");
	end
	t1.a=55;
	$display("%p",t1);
end
endmodule

