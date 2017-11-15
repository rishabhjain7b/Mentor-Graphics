// Full adder using half adder using SM

module fulladder
( input a,b,cin,
  output s,c);

wire w1,w2,w3;

ha_using_nand HA1(.a(a),.b(b),.c(w3),.s(w1)),
    	      HA2(.a(cin),.b(w1),.c(w2),.s(s));
or g1(c,w2,w3);

endmodule