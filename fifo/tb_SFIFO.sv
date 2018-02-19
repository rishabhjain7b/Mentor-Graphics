`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:39:09 07/10/2017
// Design Name:   SFIFO
// Module Name:   F:/IITGN/Course_work/Chip_Work/Sync_Testing/delsel/tb_SFIFO.v
// Project Name:  delsel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SFIFO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_SFIFO;

	// Inputs
	reg clk;
	reg rst_n;
	reg rd_en;
	reg wr_en;
	reg [3:0] din;

	// Output
	wire full,empty;
	wire [3:0] dout;
	integer fd;
	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk),
		.rst_n(rst_n), 
		.rd_en(rd_en), 
		.wr_en(wr_en),
		.full(full),
		.empty(empty), 
		.din(din), 
		.dout(dout)
	);

initial fd = $fopen("SFIFO_dump.txt");
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		rd_en = 0;
		wr_en = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10;
		rst_n = 1;
		#10;
		repeat(100) begin
			#10;
			rd_en = $random;
			wr_en = $random;
			din = $random;
		end
		$stop;
	end
	
	// Random reset generation
	initial begin
		#500 rst_n = 0;
		#10 rst_n = 1;
		#150 rst_n = 0;
		#10 rst_n = 1;
	end
 // monitoring data transaction
initial $fmonitor(fd, $time, "clk = %0d,rst_n = %0d,rd_en = %0d,wr_en = %0d,full=%0d,empty=%0d,din = %0d,dout = %0d", clk,rst_n,rd_en,wr_en,full,empty,din,dout);
	
	always #5 clk = ~clk;
endmodule

