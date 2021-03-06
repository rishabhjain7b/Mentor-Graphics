module tb_USR;
parameter n = 4;
reg [n-1:0]pin;
reg sin,clk,rst,ctrl;
reg [2:0]sel;
wire [n-1:0]pout;
wire sout;

USR u1(.pin(pin),.sin(sin),.clk(clk),.rst(rst),.ctrl(ctrl),.sel(sel),.pout(pout),.sout(sout));

initial
begin
clk = 1'b0;
end
always 
#5 clk = ~clk;

initial
begin
#4 rst =1;
#4 rst =0;
#4 rst =1;
end


initial
begin
#5 sel=3'd1;
ctrl =0 ;
#10 sin = 1;
#10 sin = 0;
#10 sin = 1;
#10 sin = 1;
#10 sin = 1;
#10 sin = 1;
ctrl = 1;
#40
#10 sel=3'd0;
#4 rst =1;
#4 rst =0;
#4 rst =1;
ctrl =0 ;
#10 sin = 1;
#10 sin = 0;
#10 sin = 1;
#10 sin = 1;
#10 sin = 1;
#10 sin = 1;
ctrl = 1;
#40
#10 sel=3'd2;
#4 rst =1;
#4 rst =0;
#4 rst =1;
ctrl =0 ;
#10 pin = 4'd1011;
#10 
#10
#10 
#10 
#10 pin = 4'd1111;
#50
ctrl = 1;
#50
#10 sel=3'd3;
#4 rst =1;
#4 rst =0;
#4 rst =1;
#2 ctrl =0 ;
#10 pin = 4'd1011;
#10 
#10
#10 
#10 
#10 pin = 4'd1111;
#50
ctrl = 1;

end

initial
#900 $stop;

endmodule

