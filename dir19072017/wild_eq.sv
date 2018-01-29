module wild_eq();
logic [3:0]A=4'b111x;
logic [3:0]B=4'bxxz1;
logic [3:0]C=4'bxxzx;

initial
begin
	$display("%b",A==?B);
	
	$display("%b",A==?C);
	
	A=4'b111x;
	if(B==?C)
	$display("C %b matches with B %b",C,B);
end
endmodule
