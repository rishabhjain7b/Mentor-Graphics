module test;
bit signed [7:0]s1=8'sb10001100;
initial
begin
	$monitor("s1= %d %b",s1,s1);
	#1 s1=s1>>>2;
	#1 s1=s1>>>2;
	#1 s1=s1>>>2;
	#1 s1=s1>>>2;
end
endmodule
