
module fetch_dummy
(input [15:0]taddr,
 input br_taken, enable_updatePC, enable_fetch,
 input clock,
 input reset,
 output [15:0]npc,pc,
 output instrmem_rd);
 
 reg [15:0]w_pc;
 wire [15:0]temp;
 
 assign pc=w_pc,
 	npc=w_pc+1;
 
 assign temp=(br_taken)?taddr:(w_pc+1);
 	
 assign instrmem_rd=(enable_fetch)?1'b1:1'bz;
 
 always @(posedge clock)
 begin
 	if(reset)
 	begin
 		w_pc<=16'h3000;
 	end
 	else
 	begin
 		if(enable_updatePC)
 		w_pc<=temp;
 		else
 		w_pc<=w_pc;
 	end
 end
 endmodule
 		
