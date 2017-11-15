// 1:8 demux using 1:4 demux using SM

module mux1to8
( input d,
  input [2:0]s,
  output [7:0]y);

//wire [1:0]y;

mux1to4 M0(.d(d),.en(~s[2]),.s(s[1:0]),.y(y[3:0])),
  	M1(.d(d),.en(s[2]),.s(s[1:0]),.y(y[7:4]));

endmodule
