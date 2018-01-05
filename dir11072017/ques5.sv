
class test;
rand reg [2:0]b,c,d;
randc reg [2:0]a;
endclass

module ques5;
test t1=new();
initial
begin
	repeat(8)
	begin
	if(t1.randomize())
	begin
	$display("%p",t1);
	end
	else
	$display("randomization failed");
	end
end
endmodule

