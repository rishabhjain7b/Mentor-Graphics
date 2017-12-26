module two_regs
(output reg [15:0]q,
 input [15:0]d,
 input clk,rst_n);

 wire [15:0]dx;
 
 register #(16) r1(.q(q),.d(dx),.clk(clk),.rst_n(rst_n));
 
 defparam r2.SIZE=16;
 register r2(.q(dx),.d(d),.clk(clk),.rst_n(rst_n));

endmodule
