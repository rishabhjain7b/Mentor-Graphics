module USR #(parameter n = 4)
(input [n-1:0]pin,				//Input port - n bit for parallel input
input sin,clk,rst,ctrl,				//Input port - 1 bit for serial input, clock, and reset (active low) repsectively
input [2:0]sel,					//Select line - 3 bit to select one of the 8 functionality of USR
output reg [n-1:0]pout,				//Output port - n bit for parallel output
output reg sout);				//Output port - 1 bit for serial output

reg [n-1:0] buffout,temp;
reg [3:0] enable;
wire w1,w2;
wire [n-1:0]w3,w4;

parameter siso = 3'd0;
parameter sipo = 3'd1;
parameter pipo = 3'd2;
parameter piso = 3'd3;
parameter rol = 3'd4;
parameter ror = 3'd5;
parameter ls = 3'd6;
parameter rs = 3'd7;

siso m1(.i(sin),.clk(clk),.rst(rst),.control(ctrl),.enable(enable[0]),.o(w1));
sipo m2(.I(sin),.clk(clk),.rst(rst),.control(ctrl),.enable(enable[1]),.o(w3));
pipo m3(.i(pin),.clk(clk),.rst(rst),.control(ctrl),.enable(enable[2]),.o(w4));
piso m4(.I(pin),.clk(clk),.rst(rst),.control(ctrl),.enable(enable[3]),.o(w2));

always @(posedge clk, negedge rst)
begin
if(!rst)
begin
enable <= 4'b1111;
pout <= {n{1'b0}};
sout <= 1'b0;
buffout <= {n{1'b0}};
temp <= {n{1'b0}};
end
else
case(sel)
siso :	begin enable <= 4'd1;
	if(ctrl)
	begin							//Control = 1 to do 1 bit serial input and 1 bit serial output at output port with n bit buffer in between 
			buffout <= {w1,buffout[n-1:1]};
			sout <= buffout[0];
	end end

sipo : begin
		enable<=4'd2;					//control=0 for load, control=1 for taking output per cycle
		buffout<=w3;
		pout <= w3;
	end

pipo : begin
		enable<=4'd4;					//control = 1 to read and get output in 1 cycle
		pout<=w4;
		buffout<=w4;
	end

piso : begin
		enable <= 4'd8;					//control=0 for load, control=1 for taking output per cycle
		sout <= w2;
		buffout <= {buffout[n-2:0],w2};
	end

rol : begin
		buffout <= {buffout[n-2:0],buffout[n-1]};
		pout <= buffout;
	end

ror : begin
		buffout <= {buffout[0],buffout[n-1:1]};
		pout <=  buffout;
	end

ls : 
		pout <= buffout<<1;

rs : 		pout <= buffout>>1; 

endcase
end


endmodule
		
		
		
		
		
			
			

