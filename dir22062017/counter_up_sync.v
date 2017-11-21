module counter_up_sync
(input clk,rst,
 output reg [3:0]q);

always @ (posedge clk)
begin
	if(!rst)
	q<=4'b0000;
	else 
	q<=q+1;
end
endmodule
