// Grey counter n-bit

module grey_count #(parameter n=4)
(input clk,rst,
 output [n-1:0]q);

reg [n-1:0]w,t={{(n-1){1'b0}},1'b1};
//reg [n-1:0]t;
always @ (posedge clk,negedge rst)
begin
	if(rst)
	begin
	t<=t+1;
	w<={t[n-1],{t[n-2:0]^t[n-1:1]}};
	end
	else
	w<={{(n-1){1'b0}},1'b1};
end

assign q=w;

endmodule
