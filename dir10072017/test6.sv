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
	//i++;
	j++;
	k++;
	m++;
	//$display("%0d",i);
	$display("%0d",j);
	$display("%0d",k);
	$display("%0d",m);
end
endtask
endclass

module test6;
base b1;
derived d1;
initial
begin
	b1=new();
	d1=new();
	d1.m++;
	d1.j++;
	b1.m++;
	b1.j++;
	d1.disp();
	b1.disp();
end
endmodule

