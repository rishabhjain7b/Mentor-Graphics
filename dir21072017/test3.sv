class Base#(int size=3,int siz=5);
bit [size:0]a;
bit [siz:0]b;
task disp();
$display("Size of vector a is %0d, size2=%0d",$size(a)-1,$size(b)-1);
endtask
endclass

module test3;
initial
begin
	Base B1;
	Base#(4) B2;
	Base#(5) B3;
	Base B4;
	Base#(7,8) B5;
	Base#(3,7) B6;
	
	B1=new();
	B2=new();
	B3=new();
	B4=new();
	B5=new();
	B6=new();

	B1.disp();
	B2.disp();
	B3.disp();
	B4.disp();
	B5.disp();
	B6.disp();
end
endmodule
