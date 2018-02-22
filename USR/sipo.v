module sipo #(parameter n=4)
(input clk,control,rst,enable,		//control=0 for load, control=1 for taking output per cycle
input I,			//4 bit input 
output reg [n-1:0]o);			//output bit 

reg [n-1:0]f;

//initial 
//f<={n{1'b0}};			//Not recommended because synthesis tool doesnt recognise initial statement, so there will be no mechanism in the obtained hardware to reset it to 0

always @(posedge clk)
begin
if(enable)
begin
if(!rst)
begin
f<={n{1'b0}};
o<={n{1'b0}};			// Therefore we are using reset functionality
end
else	
if(!control)			
f<={I,f[n-1:1]};
else
begin
o<=f;
end
end
end


endmodule



