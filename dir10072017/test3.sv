class test;
rand bit [7:0]a,b,c,d;
constraint c1{
a>30;
b>40;
c<2;
}
endclass

module test3;
test t1;
initial
begin
	t1=new();
	repeat(10)
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
