// 3:8 decoder

module dec3to8
( input [2:0]a,
  input en,
  output [7:0]y);

assign y=(en==1'b0)?7'd0:
	(a==3'b000)?7'b00000001:
	(a==3'b001)?7'b00000010:
	(a==3'b010)?7'b00000100:
	(a==3'b011)?7'b00001000:
	(a==3'b100)?7'b00010000:
	(a==3'b101)?7'b00100000:
	(a==3'b110)?7'b01000000:7'b10000000;

endmodule