module mem
(input [1:0]addr,
 input [3:0]data_in,
 output [3:0]data_out);

 reg [3:0]mem[3:0];
  
 assign data_out=mem[addr];
 
 initial
 $readmemb("test.txt",mem,0,3);
 
endmodule
