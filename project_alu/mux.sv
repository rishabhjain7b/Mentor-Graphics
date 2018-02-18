// 2:1 MUX

module mux
( input signed[31:0]in1,in2,
  input sel,
  output signed[31:0]out);

assign out=sel?in2:in1;
endmodule
