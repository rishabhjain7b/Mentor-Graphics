// 4:16 decoder using 3:8 decoder

module dec4to16
(input [3:0]i,
 output [15:0]y);
 
 dec3to8 d1 (.a(i[2:0]),.en(~i[3]),.y(y[7:0])),
 	 d2 (.a(i[2:0]),.en(i[3]),.y(y[15:8]));
 endmodule
 
