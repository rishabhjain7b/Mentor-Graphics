module writeback(clock, reset, enable_writeback, W_Control, aluout, memout, pcout, npc,sr1, sr2, dr, VSR1, VSR2, psr);

input clock, reset, enable_writeback;
input [15:0]aluout, memout, pcout, npc;
input [1:0]W_Control;
input [2:0]sr1, sr2, dr;     	
output [2:0]psr;
output [15:0]VSR1, VSR2;				

reg [15:0]DR_in;      	
reg [2:0]psr;

RegFile RF (.clock(clock), .sr1(sr1), .sr2(sr2), .din(DR_in),.dr(dr), .wr(enable_writeback),.VSR1(VSR1), .VSR2(VSR2));
  	
always @(W_Control,aluout,memout,pcout,npc)
begin
	case(W_Control)
	1: DR_in<=memout;
	0: DR_in<=aluout;
	2: DR_in<=pcout;
	3: DR_in<=npc;         
        endcase      	
end
 	
always @(posedge clock)
begin
	if (reset)
       	begin
       		psr <= 0;
       	end
       	if (enable_writeback) 
       	begin
	      	if(DR_in[15])
	      	begin
	      		psr<=3'b100;
	      	end  
				
	      	else if((|DR_in))
	      		psr<=3'h1;
	      	else              
	        	psr<=3'h2;
	end  	
end
endmodule

// RegFile module
module RegFile(clock, wr, sr1, sr2, din, dr, VSR1, VSR2);

input clock, wr;
input [2:0]sr1, sr2, dr;     	
input [15:0]din;
             	
output [15:0]VSR1, VSR2;				

reg [15:0]ram [7:0] ;
reg [15:0]R0,R1,R2,R3,R4,R5,R6,R7;
wire [2:0]addr1, addr2;
wire [15:0]data1, data2;

always @(posedge clock)
begin
	if (wr)
	ram[dr]<= din;	
end

assign	addr1 = sr1;   	
assign	addr2 = sr2;   	
assign	data1 = ram[addr1];
assign	data2 = ram[addr2];   	
assign 	VSR1 = data1;   
assign 	VSR2 = data2;

assign	R0=ram[0];
assign 	R1=ram[1];  
assign 	R2=ram[2];
assign 	R3=ram[3];  
assign 	R4=ram[4];
assign 	R5=ram[5];  
assign 	R6=ram[6];
assign 	R7=ram[7];
   
endmodule
