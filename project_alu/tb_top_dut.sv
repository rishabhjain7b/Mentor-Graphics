// top dut tb

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


module tb_top_dut;
 reg clock;
 reg reset,enable_ex;
 reg signed [31:0]src1,src2,imm,mem_data_read_in;
 reg [6:0]control_in;
 wire mem_data_wr_en;
 wire signed [31:0]aluout,mem_data_write_out;
 wire carry;
 
 integer fd;
 
 top_dut DUT (.*);
 
 initial
 fd=$fopen("top_dut.txt");
 
 initial 
 clock=1'b0;
 
 always
 #5 clock=!clock;
 
 initial
 begin
 	reset=1'b0;
 	#10 reset=1'b1;
 end
 
 initial
 begin
 	#10 enable_ex=1'b0;
 	#10 enable_ex=1'b1;
 end
 
 initial
 begin
 	
 #4	for(int i=0;i<128;i++)
 	begin
 	src1=$random;	
 	src2=$random;
 	imm=$random;
 	control_in=i;
 	#20;
 	end
 	#10 enable_ex=1'b0;
 	#10 reset=1'b0;
 	$stop;
 end
 
 
 initial
 $fmonitor(fd,$time,"clock=%0d,reset=%0d,enable_ex=%0d,src1=%0d,src2=%0d,imm=%0d,mem_data_read_in=%0d,control_in=%0b,mem_data_wr_en=%0d,mem_data_write_out=%0d,aluout=%0d,carry=%d ",clock,reset,enable_ex,src1,src2,imm,mem_data_read_in,control_in,mem_data_wr_en,mem_data_write_out,aluout,carry);
 
endmodule
