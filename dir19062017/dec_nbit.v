// n bit decoder

module dec_bit #(parameter n=4)
(input [n-1:0]i,
 input en,
 output [(2**n)-1:0]y);

assign y=en?{{{(2**n)-1}{1'b0}},1'b1}:1'b0;

endmodule
