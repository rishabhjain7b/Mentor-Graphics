// shift right register n-bit

module right_shift #(parameter n=4)
(input clk,rst,load,
 input [n-1:0]i,
 output [n-1:0]q);

//reg w=1'b0;
reg [n-1:0]t;

always @ (posedge clk,negedge rst)
begin
	if(!rst)
	begin
	t<={n{1'b0}};
	//w<=1'b0;
	end
	
	else if(load==1)
	begin
	t<=i;
	end
	
	else
	begin
	t<={1'b0,t[n-1:1]};
	//w<=w;
	end

end

assign q=(!load)?t:{n{1'b0}};

endmodule
