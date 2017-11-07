// nbit full adder

module nbit_fa #(parameter n=4)
(input [n-1:0]a,b,
 input cin,
 output [n-1:0]s,
 output co);
 
assign {co,s}=a+b+cin;

endmodule
