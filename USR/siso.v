module siso
(input i,clk,rst,control,enable,			//control = for shifting input to output in 1 clock cycle
output reg o);

always @(posedge clk)
begin
if(enable)
begin
if(!rst)
o<=0;
else if(control)
o<=i;
end
end

endmodule
