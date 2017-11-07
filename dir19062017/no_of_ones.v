// input is 5bit and output is 3bit specifying no. of ones in input

module no_of_ones
(input [4:0]a,
 output [2:0]y);
 
 assign y= a[4]+a[3]+a[2]+a[1]+a[0];
 endmodule
