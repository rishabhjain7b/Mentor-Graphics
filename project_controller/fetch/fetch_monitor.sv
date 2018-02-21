// monitor class
// pkt1---> DUT interface_____pkt2---> dummy interface 
class monitor;
packet pkt1,pkt2;
mailbox #(packet)mon_sb;
//mailbox #(packet)mon_sb2;
virtual intf i;
virtual rintf ri;

function new(mailbox #(packet)mon_sb,/*mailbox #(packet)mon_sb2,*/virtual rintf ri,virtual intf i);
this.mon_sb=mon_sb;
//this.mon_sb2=mon_sb2;
this.i=i;
this.ri=ri;
endfunction

task run;
pkt1=new();
pkt2=new();
//pkt1.clock=ri.clock;
//pkt1.reset=ri.reset;
pkt1.enable_updatePC=ri.enable_updatePC;
pkt1.enable_fetch=ri.enable_fetch;
pkt1.taddr=ri.taddr;
pkt1.br_taken=ri.br_taken;
pkt1.npc=ri.npc;
pkt1.pc=ri.pc;
pkt1.instrmem_rd=ri.instrmem_rd;

pkt2.enable_updatePC=i.enable_updatePC;
pkt2.enable_fetch=i.enable_fetch;
pkt2.taddr=i.taddr;
pkt2.br_taken=i.br_taken;
pkt2.npc=i.npc;
pkt2.pc=i.pc;
pkt2.instrmem_rd=i.instrmem_rd;

mon_sb.put(pkt1);
mon_sb.put(pkt2);
//mon_sb2.put(pkt2);
endtask

endclass

