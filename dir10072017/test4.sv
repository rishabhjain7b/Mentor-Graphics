class test;
rand bit [2:0]a,b,c;
randc bit [127:0]d;
endclass

module test4;
test t1;
initial
begin
	t1=new();
	repeat(128)
	begin
		if(t1.randomize())
		$display(" %p",t1);
		else
		$display("randomization failed");
	end
end
endmodule
//%0d %0d %0d %0d
//.a,t1.b,t1.c,t1.d
