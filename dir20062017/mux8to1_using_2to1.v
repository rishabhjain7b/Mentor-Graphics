//8:1 MUX using 2:1 MUX using SM

module mux8to1_using_2to1
( input [7:0]a,
  input [2:0]s,
  output Y);

wire [5:0]y;

mux2to1 M0(.a(a[0]),.b(a[1]),.s(s[0]),.y(y[0])),
  	M1(.a(y[0]),.b(a[2]),.s(s[0]),.y(y[1])),
 	M2(.a(y[1]),.b(a[3]),.s(s[0]),.y(y[2])),
 	M3(.a(y[2]),.b(a[4]),.s(s[0]),.y(y[3])),
 	M4(.a(y[3]),.b(a[5]),.s(s[1]),.y(y[4])),
 	M5(.a(y[4]),.b(a[6]),.s(s[1]),.y(y[5])),
 	M6(.a(a[5]),.b(a[7]),.s(s[2]),.y(Y));

endmodule