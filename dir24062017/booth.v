// booth multiplier for 4-bit number, RADIX 2

module booth
(input signed [3:0]a,b,
 input clk,rst,
 output reg [7:0]y);
 
 reg signed [7:0]w1=8'd0;
 reg signed [7:0]w2=8'd0;
 reg signed [7:0]a1=8'd0;
 reg signed [1:0]t=2'd0;
 
 reg [2:0]x=3'd0;
 	   
 always @(posedge clk)
 begin
 	if(!rst)
 	begin
 		x<=3'd0;
 		t<=2'd0;
 		a1<={{4{a[3]}},a};
 		w1<={2'b0,b,1'b0};
		w2<=0;
 	end
 	else if(x==4)
		y<=w2;
	else
 	begin
 		x<=x+3'd1;
 		if(w1[1:0]==2'b01)
 		w2<=w2+(a1<<(x));
 		else if(w1[1:0]==2'b10)
 		w2<=w2+((((~a1)+1'b1))<<(x));
 		else
 		w2<=w2+0;
		w1<=w1>>1;
 	end
 end

 endmodule
