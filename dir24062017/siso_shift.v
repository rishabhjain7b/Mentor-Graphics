// serial In serial out shift register n-bit

module siso_shift #(parameter n=4)
(input clk,rst,load,
 input i,
 output q);

reg w=1'b0;
//reg [n-1:0]t={n{1'b0}};

always @ (posedge clk,negedge rst)
begin
	if(!rst)
	begin
		w<=1'b0;
	end
	
	else if(load==1)
	begin
		w<=i;
	end
	
	else
	begin
		w<=w;
	end

end

assign q=(!load)?w:1'b0;

endmodule
