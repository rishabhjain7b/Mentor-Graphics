// solve before constraints

module test2;
class B;
rand bit s;
rand bit [31:0]d;
constraint c{d->s==0;}
//constraint c1{solve d before s;}
endclass

B b=new();
initial
begin
	repeat(10)
	begin
		b.randomize();
		$display("%p",b);
	end
end
endmodule
