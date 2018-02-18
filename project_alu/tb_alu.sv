// executive preprocessor stage 1

`define CLK_PERIOD 10

`define REGISTER_WIDTH 32
`define INSTR_WIDTH 32
`define IMMEDIATE_WIDTH 16

`define MEM_READ 3'b101
`define MEM_WRITE 3'b100
`define ARITH_LOGIC 3'b001
`define SHIFT_REG 3'b000

// ARITHMETIC 
`define ADD 3'b000
`define HADD 3'b001
`define SUB 3'b010
`define NOT 3'b011
`define AND 3'b100
`define OR 3'b101
`define XOR 3'b110
`define LHG 3'b111
 
// SHIFTING 
`define SHLEFTLOG 3'b000
`define SHLEFTART 3'b001
`define SHRGHTLOG 3'b010
`define SHRGHTART 3'b011
 
// DATA TRANSFER 

`define LOADBYTE 3'b000 
`define LOADBYTEU 3'b100 
`define LOADHALF 3'b001
`define LOADHALFU 3'b101 
`define LOADWORD 3'b011


module tb_alu;
 reg clock;
 reg reset;
 reg signed [31:0]aluin1,aluin2;
 reg [2:0]operation,opselect;
 reg [4:0]shift_number;
 reg enable_arith,enable_shift;
 wire signed [31:0]aluout;
 wire carryout;
 
 integer fd;
 
 alu DUT (.*);
 
 initial
 fd=$fopen("alu.txt");
  
 initial 
 clock=1'b0;
 
 always
 #5 clock=!clock;
 
 initial
 begin
 	reset=1'b0;
 	#4 reset=1'b1;
 end
 
 initial
 begin 	
 	for(int i=0;i<32;i++)
 	begin
	 for(int j=0;j<2;j++)
	 begin 
	  for(int k=0;k<2;k++)
 	  begin
 	   for(int m=0;m<8;m++)
 	   begin
 	    for(int n=0;n<8;n++)
 	    begin
 	  #10 aluin1=$random;	
 	  aluin2=$random;
 	  operation=m;
 	  opselect=n;
 	  shift_number=i;
 	  enable_arith=j;
 	  enable_shift=k;
 	  end
 	 end 	
 	end
 	end
 	end
 
 	#10 reset=1'b0;
 	$stop;
 end
 
 initial
 $fmonitor(fd,$time,"clock=%0d,reset=%0d,aluin1=%0d,aluin2=%0d,operation=%0d,opselect=%0d,shift_number=%0d,enable_arith=%0d,enable_shift=%0d,aluout=%0d,carryout=%0d",clock,reset,aluin1,aluin2,operation,opselect,shift_number,enable_arith,enable_shift,aluout,carryout);
 
endmodule
