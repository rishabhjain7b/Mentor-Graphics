// count odd 1-31, even 32-63 and then restart

module count_odd_even
(input clk,rst,
 output [5:0]q);

reg [5:0]w;

initial
w=6'd0;

always @ (posedge clk,negedge rst)
begin
	if(rst)
	begin
		w<=w+1;
		if(w==6'd0)
		w<=w+1;
				
		else if(w==6'd31)
		w<=w+1;
		
		else if(w==6'd63)
		w<=6'd0;
		
		else
		begin
		w<=w+2;
		end		
	end
	else
	w<=6'd0;
end

assign q=w;

endmodule
