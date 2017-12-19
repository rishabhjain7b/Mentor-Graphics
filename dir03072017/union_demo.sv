
module union_demo;

union
{ reg [7:0]a;
  logic [3:0]c;
  bit [4:0]b;
}m;

initial
begin
	m.c=4'b0101;
	m.a=8'b11010101;
	m.b=5'b10101;
	
	$display(" %b %b %b %p",m.a,m.b,m.c,m);
end
endmodule
