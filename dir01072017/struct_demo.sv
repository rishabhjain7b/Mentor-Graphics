
module struct_demo;

struct packed
{ logic [7:0]a;
  bit [4:0]b;
  reg [3:0]c;
}m;

initial
begin
	m.a=8'b0111_1000;
	m.b=5'b01111;
	m.c=4'b1100;
	
	$display("%b",m.a);
	$display("%b",m.b);
	$display("%b",m.c);
	//$display("%p",m[14:8]);
	$display("%p",m);
end
endmodule
