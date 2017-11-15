// 4:1 mux using 2:1 mux using SM

module mux4to1_using_2to1
( input [3:0]a,
  input [1:0]s,
  output Y);

wire [1:0]y;

mux2to1 M0(.a(a[0]),.b(a[1]),.s(s[0]),.y(y[0])),
  	M1(.a(y[0]),.b(a[2]),.s(s[0]),.y(y[1])),
 	M2(.a(y[1]),.b(a[3]),.s(s[1]),.y(Y));

endmodule