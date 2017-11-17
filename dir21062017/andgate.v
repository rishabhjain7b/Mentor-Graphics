// and gate using bm

module andgate
(input a,b,
 output reg y);

always @ (a,b)
y=a&b;
endmodule
