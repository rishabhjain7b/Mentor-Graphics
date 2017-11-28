// combinational and sequential ckt

module seq_combo
(input clk,rst,
 output reg q);
 
 reg [2:0]w=3'b000;
 
 dff1 d1 (.d(~w[0]),.clk(clk),.q(w[0])),
      d2 (.d(w[1]),.clk(clk),.q(w[2]));
 
 always @(posedge clk)
 begin
 	if(!rst)
 	w<=3'b000;
 	else
 	w[0]<=
