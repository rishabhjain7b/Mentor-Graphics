
class test;
rand reg [2:0]a,b;
constraint c1{
a==5|a==7;
b>=4;
b<=6;
}
endclass

module ques3;
test t1=new();
initial
begin
	repeat(10)
	begin
	if(t1.randomize())
	$display("%p",t1);
	else
	$display("randomization failed");
	end
end
endmodule

