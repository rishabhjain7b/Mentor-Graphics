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


module tb_preprocessor;
 reg clock;
 reg reset,enable_ex;
 reg signed [31:0]src1,src2,imm,mem_data_read_in;
 reg [6:0]control_in;
 wire mem_data_wr_en;
 wire signed [31:0]mem_data_write_out;
 wire signed [31:0]aluin1,aluin2;
 wire [2:0]operation_out,opselect_out;
 wire [4:0]shift_number;
 wire enable_arith,enable_shift;
 
 integer fd;
 
 preprocessor DUT (.*);
 
 initial
 fd=$fopen("preprocessor.txt");
 
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
 	#7 enable_ex=1'b0;
 	#10 enable_ex=1'b1;
 end
 
 initial
 begin
 	for(int i=0;i<128;i++)
 	begin
 	#5 src1=$random;	
 	src2=$random;
 	imm=$random;
 	control_in=i;
 	end
 	#10 enable_ex=1'b0;
 	#10 reset=1'b0;
 	$stop;
 end
 
 initial
 $fmonitor(fd,$time,"clock=%0d,reset=%0d,enable_ex=%0d,src1=%0d,src2=%0d,imm=%0d,mem_data_read_in=%0d,control_in=%0d, mem_data_wr_en=%0d,mem_data_write_out=%0d,aluin1=%0d,aluin2=%0d,operation_out=%0d,opselect_out=%0d,shift_number=%0d,enable_arith=%0d,enable_shift=%0d ",clock,reset,enable_ex,src1,src2,imm,mem_data_read_in,control_in,mem_data_wr_en,mem_data_write_out,aluin1,aluin2,operation_out,opselect_out,shift_number,enable_arith,enable_shift);
 
endmodule
