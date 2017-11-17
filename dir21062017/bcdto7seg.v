module bcdto7seg
(input [3:0]a,
 output reg [6:0]y);

always @(a)
begin
	case(a)
	4'd0: y=7'b0111111;
	4'd1: y=7'b0000110;
	4'd2: y=7'b1011011;
	4'd3: y=7'b1001111;
	4'd4: y=7'b1100110;
	4'd5: y=7'b1101101;
	4'd6: y=7'b1111101;
	4'd7: y=7'b0000111;
	4'd8: y=7'b1111111;
	4'd9: y=7'b1101111;
	default: y=7'd0;
	endcase
end
endmodule
