module fibonacci;
	
function fib
(input int n);
automatic int f=1,s=1,t;
begin
	$display("%d \n%d",f,s);
	for(int i=3;i<n;i++)
	begin
		t=f+s;
		$display("%d",t);
		f=s;
		s=t;
	end
end
endfunction

initial
fib(10);	
endmodule
