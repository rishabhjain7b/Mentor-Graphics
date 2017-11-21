// counter 0-9 then reset

module dec_count
(input clk,rst,
 output [3:0]q);

reg [3:0]w=4'd0;

always @ (posedge clk,negedge rst)
begin
	if(rst)
	begin
		w<=w+1;
		if(w==4'd9)
		w<=4'd0;		
	end
	else
	w<=4'd0;
end

assign q=w;

endmodule
