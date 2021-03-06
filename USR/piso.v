module piso #(parameter n=4)
(input clk,control,enable,rst,		//control=0 for load, control=1 for taking output per cycle
input [n-1:0]I,			//4 bit input 
output reg o);			//output bit 

reg [n-1:0]f;

always @(posedge clk)
begin
if(enable)
begin
if(!rst)
o<=0;
else
if(!control)
f<=I;
else
begin
o<=f[0];
f<={1'b0,f[n-1:1]};
end
end
end


endmodule



