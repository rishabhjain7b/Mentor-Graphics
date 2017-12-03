module test;
reg [7:0]a=8'b10010011;
reg b[7:0]={1,0,0,0,0,1,1,1};

initial
begin
	$display("%b",a[7]);
	$display("%b",b[7]);
	$display("%b",a[7:4]);
	$display("%b",a);
	$display("%p",b[7:4]);
	$display("%p",b);
end 
endmodule

