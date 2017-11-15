// 1:4 mux using SM

module mux1to4
( input [1:0]s,
  input d,en,
  output [3:0]y);

//wire y1,y2,y3,y4;

and g1(y[0],d,en,~s[1],~s[0]),
    g2(y[1],d,en,~s[1],s[0]), 
    g3(y[2],d,en,s[1],~s[0]), 
    g4(y[3],d,en,s[1],s[0]);

//or g5(y,y1,y2,y3,y4);

endmodule
