module pipo #(parameter n=4)
(input [n-1:0]i,
input clk,rst,control,enable,		//control = 1 to read and get output in same cycle
output reg [n-1:0]o);

always @(posedge clk)
begin
if(enable)
begin
if(!rst)
o<={n{1'b0}};
else if(control)
o<=i;
end
end


endmodule

