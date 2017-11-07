// nbit mux

module mux_nbit #(parameter n=4)
(input [n-1:0]a,
 input [($clog2(n)-1):0]sel,
 output y);

assign y=a[sel];

endmodule

