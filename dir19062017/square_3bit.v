// square of a 3bit i/p

module square_3bit
(input [2:0]a,
 output [5:0]y);
 
 wire [5:0]w1,w2,w3;
 assign w1=a[0]?{3'd0,a}:0,
 	w2=a[1]?{a,1'd0}:0,
 	w3=a[2]?{a,2'd0}:0,
 	y=w1+w2+w3;
 endmodule
 
