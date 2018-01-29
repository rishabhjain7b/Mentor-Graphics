module case3;
int a,b;
initial
begin
	a=0;
	b=1;
	#5 c=b+a;
end
initial
begin
	b=0;
	a=1;
	$display("%d",c);
end 
endmodule
