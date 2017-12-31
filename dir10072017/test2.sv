class base;
int i=7;
task disp1();
begin
	$display("%d",i);
end
endtask
endclass

class derived extends base;
int j=14;
task disp2();
begin
	$display("%d %d",i,j);
end
endtask
endclass

module test2;
derived d1;
base b1;
initial
begin
	d1=new();
	d1.disp1();
	b1=new();
	//b1.disp2();
end
endmodule
