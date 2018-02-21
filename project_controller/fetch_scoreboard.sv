// scoreboard class

class scoreboard;
packet pkt1,pkt2;
mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;

function new(mailbox #(packet)drv_sb,mailbox #(packet)mon_sb);
this.drv_sb=drv_sb;
this.mon_sb=mon_sb;
endfunction

task run;
mon_sb.get(pkt1);
drv_sb.get(pkt2);

case(pkt2.sel)
	`ADD: {pkt2.co,pkt2.s}=pkt2.a+pkt2.b;
	`SUB: {pkt2.co,pkt2.s}=pkt2.a-pkt2.b;
	`INR: {pkt2.co,pkt2.s}=pkt2.a+1'b1;
	`DCR: {pkt2.co,pkt2.s}=pkt2.a-1'b1;
	`AND: begin
		pkt2.co=1'b0;
		pkt2.s=pkt2.a&pkt2.b;
	     end
	`OR: begin
		pkt2.co=1'b0;
		pkt2.s=pkt2.a|pkt2.b;
	     end	
	`XOR: begin
		pkt2.co=1'b0;
		pkt2.s=pkt2.a^pkt2.b;
	     end	
	`CMP: {pkt2.co,pkt2.s}={1'b0,~pkt2.b};
	//default: {co,s}={(n+1){1'bx}};
endcase

if(reset)
begin
	pkt2.pc=16'h3000;
end
else
begin
	if(enable_updatePC)
	pkt2.pc=(br_taken)?taddr:(w_pc+1);;
	else
	pc<=w_pc;
end

pkt2.npc=pkt2.pc+1;
pkt2.instrmem_rd=(pkt2.enable_fetch)?1'b1:1'bz;

assert(pkt1.co==pkt2.co && pkt1.s==pkt2.s)
begin
	$display(" design is ok");
	$display($time,"sel=%b a=%b b=%b s=%b co=%b",pkt1.sel,pkt1.a,pkt1.b,pkt1.s,pkt1.co);
end
else
begin
	$display(" design is not ok");
	$display($time,"sel=%b a=%b b=%b s=%b co=%b",pkt1.sel,pkt1.a,pkt1.b,pkt1.s,pkt1.co);
end
endtask

endclass

