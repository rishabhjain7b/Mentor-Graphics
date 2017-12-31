class base;
local int i=50;
      int j=75;
protected int k=100;
static int m=102;
task disp();
begin
	$display("%0d %0d %0d %0d",i,j,k,m);
end
endtask
endclass

class derived extends base;
task disp();
begin
	j++;
	k++;
	m++;
	$display("%0d",j);
	$display("%0d",k);
	$display("%0d",m);
end
endtask
endclass

class derived1 extends base;
task disp();
begin
	j++;
	k++;
	m++;
	$display("%0d",j);
	$display("%0d",k);
	$display("%0d",m);
end
endtask
endclass


module test_multiple;
base b1;
derived d1;
derived1 d11;
initial
begin
	b1=new();
	d1=new();
	d11=new();
	d1.m++;
	d1.j++;
	b1.m++;
	b1.j++;
	d11.m++;
	d11.j++;
	b1.disp();
	d1.disp();
	d11.disp();
end
endmodule

