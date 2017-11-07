// priority encoder

module pri_enc_nbit #(parameter n=4)
(input [(2**n)-1:0]i,
 input en,
 output [n-1:0]y);
 
 assign y= en?(i[n-1]==1)?(n-1):0:0;
endmodule
