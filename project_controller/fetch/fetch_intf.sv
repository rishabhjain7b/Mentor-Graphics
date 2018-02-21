
interface intf(input clock,reset);
bit [15:0]taddr;
bit br_taken;
bit enable_updatePC;
bit enable_fetch;
logic instrmem_rd;
bit [15:0]pc,npc;

//modport drv(output [15:0]taddr,output br_taken,enable_updatePC,enable_fetch,clock,reset);
//modport mon(input instrmem_rd,input [15:0]pc,npc;);

endinterface
