
class base;
int a;
endclass

module main;
base b1,b2;
initial
begin
	b1=new;
	b1.a=90;
	$display("%d",b1.a);
	b2=new b1;
	$display("%d",b2.a);
	b2.a=200;
	b1.a=700;
	$display("%d",b1.a);
	$display("%d",b2.a);
end
endmodule
