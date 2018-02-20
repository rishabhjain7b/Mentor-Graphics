//D flip flop for arbiter

module dff
(input clock,din,
 output reg dout);
 
always @(posedge clock)
begin
	dout<=din;
end
endmodule