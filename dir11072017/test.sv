class random_test;
rand bit a=1;
rand int b;
constraint c1{a->b inside {[31:45],32};}
endclass

module test;
random_test t1;
initial
begin
	t1=new();
	repeat(10)
	begin
		if(t1.randomize())
		$display("%b %d",t1.a,t1.b);
		else
		$display("failed");
	end
end
endmodule
