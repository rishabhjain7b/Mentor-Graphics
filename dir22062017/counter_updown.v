module counter_updown
(input clk,rst,updown,
 output reg [3:0]q);

always @ (posedge clk)
begin
	if(!rst)
	q<=4'b0000;
	else if(updown)
	q<=q+1;
	else
	q<=q-1;
end
endmodule
