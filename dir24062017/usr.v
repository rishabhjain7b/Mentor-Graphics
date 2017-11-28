// code for universal shift register

/* n-size input > i;
   1-bit input > in;
   n-size output > q
   1-bit input > out;
   1: PISO
   2: SIPO
   3: PIPO
   4: SISO
   5: ROR
   6: ROL
   7: LEFT SHIFT
   8: RIGHT SHIFT
*/  
   
module usr #(parameter n=4)
(input [2:0]op,
 input clk,rst,load,in,
 input [n-1:0]i,
 output reg out,
 output reg [n-1:0]q);
 
 wire [n-1:0]w1,w2,w3,w4,w5,w6;
 wire t1,t2;
 
 piso_shift p1 (.clk(clk),.rst(rst),.load(load),.i(i),.q(t1));
 sipo_shift p2 (.clk(clk),.rst(rst),.load(load),.i(in),.q(w1));
 pipo_shift p3 (.clk(clk),.rst(rst),.load(load),.i(i),.q(w2));
 siso_shift p4 (.clk(clk),.rst(rst),.load(load),.i(in),.q(t2));
 ror_shift p5 (.clk(clk),.rst(rst),.load(load),.i(i),.q(w3));
 rol_shift p6 (.clk(clk),.rst(rst),.load(load),.i(i),.q(w4));
 left_shift p7 (.clk(clk),.rst(rst),.load(load),.i(i),.q(w5));
 right_shift p8 (.clk(clk),.rst(rst),.load(load),.i(i),.q(w6));
 
always @ (posedge clk, negedge rst)
begin
	case(op)
	3'b000: out<=t1;
	3'b001: q<=w1;	
	3'b010: q<=w2;
	3'b011: out<=t2;
	3'b100: q<=w3;
	3'b101: q<=w4;
	3'b110: q<=w5;
	3'b111: q<=w6;
	endcase
end
endmodule
	
