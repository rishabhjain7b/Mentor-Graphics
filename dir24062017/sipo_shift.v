// serial In parellel out shift register n-bit

module sipo_shift #(parameter n=4)
(input clk,rst,load,
 input i,
 output [n-1:0]q);

reg w=1'b0;
reg [n-1:0]t={n{1'b0}};

always @ (posedge clk,negedge rst)
begin
	if(!rst)
	begin
		w<=1'b0;
		t<={n{1'b0}};
	end
	
	else if(load==1)
	begin
		w<=i;
		t<={t[n-2:0],w};
	end
	
	else
	begin
	t<=t;
	w<=w;
	end

end

assign q=(!load)?t:1'b0;

endmodule
