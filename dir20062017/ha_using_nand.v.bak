// Half adder using nand only

module ha_using_nand
( input a,b,
  output s,c);

wire w1,w2,w3;

nand g1(w1,a,b),
     g2(w2,w1,a),
     g3(w3,w1,b),
     g4(s,w2,w3),
     g5(c,w1,w1);
endmodule