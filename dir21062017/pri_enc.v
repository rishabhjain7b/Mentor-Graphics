module pri_enc
(input [3:0]a,
 output reg [1:0]y);

always @ (a)
begin
	if(a[3]==1'b1)
		y=2'b11;
	else if(a[2]==1'b1)
		y=2'b10;
	else if(a[1]==1'b1)
		y=2'b01;
	else if(a[0]==1'b1)
		y=2'b00;
	else
		y=2'bxx;
end 
endmodule
