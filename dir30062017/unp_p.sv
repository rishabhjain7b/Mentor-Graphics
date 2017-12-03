
module unp_p;
reg b[7:0]='{1,0,0,0,1,1,1,1};
reg [7:0]a;
reg c[7:0];
reg [7:0]d=8'b10011110;

// unpacked to packet 
initial
begin
	for(int i=0;i<8;i++)
	a[i]=b[i];
	$display("%p to %b",b,a);
end

// packed to unpacket 
initial
begin
	for(int i=0;i<8;i++)
	c[i]=d[i];
	$display("%b to %p",d,c);
end

endmodule


