// automatic and static variable

module test1;
int i=3;
initial
begin
	while(i--)
	begin
		automatic int i=101;
		i--;
		$display("%d",i);
	end
end
endmodule

	