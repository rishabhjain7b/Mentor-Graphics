class base;
rand int a;
constraint c1{
a<100;
a>0;
}
endclass

class derived extends base;
constraint c2{
a<0;
}
endclass

module test5;
derived d1;

initial
begin
	d1=new();
	repeat(10)
	begin
		if(d1.randomize())
		$display("success a=%d",d1.a);
		else
		$display("randomization failed");
	end
end
endmodule
