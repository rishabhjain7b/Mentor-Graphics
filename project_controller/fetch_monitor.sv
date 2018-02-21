// monitor class

class monitor;
packet pkt;
mailbox #(packet)mon_sb;
virtual intf i;

function new(mailbox #(packet)mon_sb,virtual intf i);
this.mon_sb=mon_sb;
this.i=i;
endfunction

task run;
pkt=new();
pkt.clock=i.clock;
pkt.reset=i.reset;
pkt.enable_updatePC=i.enable_updatePC;
pkt.enable_fetch=i.enable_fetch;
pkt.taddr=i.taddr;
pkt.br_taken=i.br_taken;
pkt.npc=i.npc;
pkt.pc=i.pc;
pkt.instrmem_rd=i..instrmem_rd;
mon_sb.put(pkt);
endtask

endclass

