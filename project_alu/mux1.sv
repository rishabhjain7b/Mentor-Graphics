// 2:1 MUX

module mux1
( input a,b,
  input s,
  output y);

assign y=s?b:a;
endmodule
