// parallel In serial out shift register n-bit

module piso_shift #(parameter n=4)
(input clk,rst,load
 input [n-1:0]i,
 output q);

reg w=1'b0;
reg [n-1:0]t;

always @ (posedge clk,negedge rst)
begin
	if(!rst)
	begin
	t<=i;
	w<=1'b0;
	end
	
	else if(load==1)
	begin
	t<={1'b0,t[n-1:1]};
	w<=t[0];
	end
	
	else
	begin
	t<=t;
	w<=w;
	end

end

assign q=(!load)?w:1'b0;

endmodule
