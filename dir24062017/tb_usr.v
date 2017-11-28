// code for universal shift register

/* n-size input > i;
   1-bit input > in;
   n-size output > q
   1-bit input > out;
   1: PISO
   2: SIPO
   3: PIPO
   4: SISO
   5: ROR
   6: ROL
   7: LEFT SHIFT
   8: RIGHT SHIFT
*/  
   
module tb_usr; 
 reg [2:0]op;
 parameter n=4;
 reg clk,rst,load,in;
 reg [n-1:0]i;
 wire out;
 wire [n-1:0]q;
 //reg [2:0]k;
 
 usr dut (.clk(clk),.op(op),.rst(rst),.load(load),.i(i),.in(in),.q(q),.out(out)); 
 integer fd;
 
 initial fd=$fopen("usr.txt");
  
 initial 
 begin
 	clk = 1'b0;
 	rst = 1'b0;
 	load = 1'b0;
 	in = 1'b0;
 	i={n{1'b0}};
 	#10 rst=1'b1;
 end
 
 always #5 clk=~clk;
 
initial
begin
	op=3'b000;
	#12 load=1; in=0; 
	#12 i=4'b1001;
	#12 load=0;
	
	#48 op=3'b001; load=1; i=0;
	#12 in=1'b1;
	#12 in=1'b0;
	#12 in=1'b0;
	#12 in=1'b1; load=0;
	
	#12 op=3'b010; load=1; in=0;
	#12 i=4'b1101;
	#12 load=0;
	
	#12 op=3'b010; load=1; in=0;
	#12 i=4'b1011;
	#12 load=0;
	
	#12 op=3'b011; load=1; i=0;
	#12 in=1'b1;
	#12 in=1'b0;
	#12 in=1'b0;
	#12 in=1'b1; load=0;
	
	#48 op=3'b100;	load=1; in=0;
	#12 i=4'b1001; 
	#12 load=0;
	
	#12 op=3'b101;	load=1; in=0;
	#12 i=4'b1001;
	#12 load=0;
	
	#12 op=3'b110;	load=1; in=0;
	#12 i=4'b1001;
	#12 load=0;
	
	#12 op=3'b111;	load=1; in=0;
	#12 i=4'b1001;
	#12 load=0;
	
	#48 op=3'b001; load=1; i=0;
	#12 in=1'b1;
	#12 in=1'b0;
	#12 in=1'b0;
	#12 in=1'b1; load=0;
	#10 rst=1'b0;

end

initial
begin
	$fmonitor(fd, $time," op=%d, i=%b, in=%b, out=%b, q=%b",op,i,in,out,q);
	$monitor($time," op=%d, i=%b, in=%b, out=%b, q=%b",op,i,in,out,q);
end
endmodule
	
