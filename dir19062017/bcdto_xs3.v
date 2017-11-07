// bcd to excess 3

module bcdto_xs3 #(parameter n=4)
(input [n-1:0]a,
 output [n-1:0]y);
 
 assign y= (a<=9)?a+3:a+9;
 endmodule
