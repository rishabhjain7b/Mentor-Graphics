// testing real

module test;

real a,b,y;

initial
begin
	a=21.42;
	b=43.75;
	y=a+b;
	$display("%f",y);
end
endmodule

