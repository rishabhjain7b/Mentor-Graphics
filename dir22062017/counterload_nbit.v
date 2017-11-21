module counterload_nbit #(parameter n=4)
(input [n-1:0]load,
 input clk,rst,updown,f,
 output reg [n-1:0]q);

initial
q=load;

always @ (posedge clk, negedge rst)
begin
	if(rst)
	begin
		if(!f)
			q<={n{1'b0}};
		else
		begin
			if(updown)
				q<=q+1;
			else
				q<=q-1;
		end
	end
	else
		q<={n{1'b0}};
end
endmodule
