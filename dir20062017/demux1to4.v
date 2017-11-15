// 1:4 demux 

module demux1to4
( input [1:0]s,
  input d,
  output [3:0]y);

and g1(y[3],~s[1],~s[0],d),
    g2(y[2],~s[1],s[0],d),
    g3(y[1],s[1],~s[0],d),
    g4(y[0],s[1],s[0],d);

endmodule
