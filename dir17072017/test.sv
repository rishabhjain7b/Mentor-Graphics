// polymorphism with virtual

class base;
virtual task disp();
$display("BASE");
endtask
endclass

class derived extends base;
task disp();
$display("DERIVED");
super.disp();
endtask
endclass

module test;
base b1;
derived d1;
initial
begin
	b1=new;
	b1.disp();
	
	d1=new;
	d1.disp();
	
	b1=d1;
	b1.disp();
	b1=new;
	b1.disp();
end
endmodule
