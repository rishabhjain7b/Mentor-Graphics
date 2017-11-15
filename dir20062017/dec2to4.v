//2:4 decoder using SM

module dec2to4
( input [1:0]s,
  output [3:0]y);

and g1(y[0],~s[1],~s[0]),
    g2(y[1],~s[1],s[0]), 
    g3(y[2],s[1],~s[0]), 
    g4(y[3],s[1],s[0]);
endmodule