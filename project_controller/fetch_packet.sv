// packet class

class packet;
rand bit [15:0]taddr;
rand bit br_taken;
rand bit enable_updatePC;
rand bit enable_fetch;
bit clock;
bit reset;
bit instrmem_rd;
bit [15:0]pc,npc;
endclass

