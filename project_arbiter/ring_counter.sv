// Ring Counter (ARBITER)

module ring_counter #(parameter n=4)
(input clock,reset_n,
 output [n-1:0]dout);
 
 reg [n-1:0]count;
 
always @(posedge clock, negedge reset_n)
begin
	if(!reset_n)
	count=1;
	else
	begin
		if(count={1'b1,{(n-1){1'b0}}})
		count=1;
		else
		count=count<<1;
	end
end

assign dout=count;
endmodule