// binary to gray converter nbit

module b2g_nbit #(parameter n=4)
(input [n-1:0]b,
 output [n-1:0]g);
 
assign g=b^(b>>1);

endmodule
