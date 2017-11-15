// 4:1 mux using SM

module mux4to1
( input [1:0]s,
  input a,b,c,d,
  output y);

wire y1,y2,y3,y4;

and g1(y1,a,~s[1],~s[0]),
    g2(y2,b,~s[1],s[0]), 
    g3(y3,c,s[1],~s[0]), 
    g4(y4,d,s[1],s[0]);

or g5(y,y1,y2,y3,y4);

endmodule