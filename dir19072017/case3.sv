module case3;
int a,b;
initial
fork
	a=4;
	b=3;
	b=b+a;
	a=a+b;
	a=a-1;
	$display("%d %d",a,b);
join 
endmodule
