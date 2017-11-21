// Ring counter n-bit

module ring_count #(parameter n=4)
(input clk,rst,
 output [n-1:0]q);

reg [n-1:0]w={{(n-1){1'b0}},1'b1};

always @ (posedge clk,negedge rst)
begin
	if(rst)
	w<={w[0],w[n-1:1]};
	else
	w<={{(n-1){1'b0}},1'b1};
end

assign q=w;

endmodule
