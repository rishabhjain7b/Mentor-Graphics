
/* 
   This file is the debugged version of FETCH code which is a part of LC3 microcontroller.
   Each line containing error has been corrected and the correction made is written next
   to it in a comments.
   The comments specifies the wrong code which were present earlier. 
*/

module fetch(clock,reset,enable_updatePC,enable_fetch,pc,npc,instrmem_rd,taddr, br_taken);

input clock,reset,enable_updatePC,enable_fetch,br_taken;
input [15:0]taddr;					//input [12:0]tadder;

output [15:0]pc,npc;					//npc_out --> npc	
output instrmem_rd;

reg [15:0]ipc;
wire [15:0]muxout;					//wire [14:0]muxout;
					//wire [17:0]npc_int;

always @(posedge clock)		//always @(posedge clock,negedge reset,posedge set)	
begin
	if (enable_updatePC==0)		//assert (enable_updatePC==0)
	$display("--FETCH--enable_updatePC = %b enable_fetch = %b pc=%h ", enable_updatePC,enable_fetch,pc);
	else 
	$info("enable_updatePC = %b enable_fetch = %b pc=%h ", enable_updatePC,enable_fetch,pc);

	if(reset)
	begin
		ipc<=16'h3000;			//ipc<=16'h3002; ipc<=16'h3005;
	end
		
	else
	begin
		if(enable_updatePC)
		begin
			ipc <= muxout;
		end
		else
		begin
			ipc<=ipc;		//ipc<=ipc+4;
		end
	end
end

assign muxout=(br_taken)?taddr:(ipc+1);
					   //assign muxout=(br_taken)?taddr:(npc_int+2); 
assign npc = ipc+1;			//npc = ipc +1 ;	
assign pc = ipc;

/*
assign npc_int=ipc+1;
assign npc_int=ipc+ 2 + ipc;;
assign npc_out = npc_int;
assign npc_out = npc_int+2;
npc_out = npc_int;
*/

assign instrmem_rd = (enable_fetch)?1'b1:1'bz;
					//assign instrmem_rd = (enable_fetch)?1'b0: 1'b0;

endmodule

