// scoreboard class

class scoreboard;
packet pkt1,pkt2;
//mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
//mailbox #(packet)mon_sb2;

function new(mailbox #(packet)mon_sb/*,mailbox #(packet)mon_sb2*/);
this.mon_sb=mon_sb;
//this.mon_sb2=mon_sb2;
endfunction

task run;
mon_sb.get(pkt1);
mon_sb.get(pkt2);
//mon_sb2.get(pkt2);

assert(pkt1.instrmem_rd==pkt2.instrmem_rd && pkt1.pc==pkt2.pc && pkt1.npc==pkt2.npc)
begin
	$display(" design is ok");
	$display($time,"enable_updatePC=%b | enable_fetch=%b | taddr=%x | br_taken=%b | instrmem_rd=%b | pc=%x | npc=%x ",pkt1.enable_updatePC,pkt1.enable_fetch,pkt1.taddr,pkt1.br_taken,pkt1.instrmem_rd,pkt1.pc,pkt1.npc);
end

else
begin
	$display(" design is NOT ok");
	$display($time,"enable_updatePC=%b | enable_fetch=%b | taddr=%x | br_taken=%b | instrmem_rd=%b | pc=%x | npc=%x ",pkt1.enable_updatePC,pkt1.enable_fetch,pkt1.taddr,pkt1.br_taken,pkt1.instrmem_rd,pkt1.pc,pkt1.npc);
end
endtask

endclass

