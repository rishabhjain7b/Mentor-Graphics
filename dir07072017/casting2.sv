module casting2
(input clk);

int area,rad=4;

always @(posedge clk)
begin
	$cast(area,3.14*rad*rad);
	$display(area);
end
endmodule

