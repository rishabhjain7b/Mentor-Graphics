module test(input clk);
reg [3:0]a,b;

initial
begin 
	a=4'b0011;
	b=4'b0010;
end

always @ (posedge clk)
	a<=b;
always @ (posedge clk)
	b<=a;
//end
endmodule

