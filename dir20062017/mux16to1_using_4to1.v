// 16:1 mux using 4:1 mux using SM

module mux16to1_using_4to1
( input [15:0]a,
  input [3:0]s,
  output Y);

wire [3:0]y;

mux4to1_using_2to1 M0(.a(a[3:0]),.s(s[1:0]),.Y(y[0])),
  		   M1(.a({y[0],a[6:4]}),.s(s[1:0]),.Y(y[1])),
 		   M2(.a({y[1],a[9:7]}),.s(s[1:0]),.Y(y[2])),
 		   M3(.a({y[2],a[12:10]}),.s(s[1:0]),.Y(y[3])),
 		   M4(.a({y[3],a[15:13]}),.s(s[3:2]),.Y(Y));
endmodule