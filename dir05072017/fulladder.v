// FA using BM

module fulladder
(input a,b,cin,
 output reg s,c);

reg t1,t2;

always @ (a,b,cin)
begin 
	t1=a^b;
	s=t1^cin;
	t2= a&b|b&cin;
	c=t2|cin&a;
end
endmodule