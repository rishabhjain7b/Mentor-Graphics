module register #(localparam SIZE=8)

(output reg [SIZE-1:0]q,
 input [SIZE-1:0]d,
 input clk,rst_n);
 
 always @(posedge clk, negedge rst_n)
 begin
 	if(!rst_n) q<=0;
 	else q<=d;
 end
 endmodule
