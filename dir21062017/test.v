// and gate using bm

module test
(input a,b,
 output reg y,s);

always @ (a,b)
//begin
y=a&b;
always @ (a,b)
s=a|b;
//end
endmodule