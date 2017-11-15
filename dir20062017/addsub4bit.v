// 4 bit adder/subtractor using SM
// cin=1: subtraction , =0:addition

module addsub4bit
( input [3:0]a,bo,
  input cin,
  output [3:0]s,
  output co);

wire c1,c2,c3;
wire [3:0]b;

xor x1(b[0],bo[0],cin),
    x2(b[1],bo[1],cin),
    x3(b[2],bo[2],cin),
    x4(b[3],bo[3],cin);

fulladder FA0(.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]),.c(c1)),
    	  FA1(.a(a[1]),.b(b[1]),.cin(c1),.s(s[1]),.c(c2)),
	  FA2(.a(a[2]),.b(b[2]),.cin(c2),.s(s[2]),.c(c3)),
	  FA3(.a(a[3]),.b(b[3]),.cin(c3),.s(s[3]),.c(co));

endmodule