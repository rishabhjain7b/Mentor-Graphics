class coverage;
//bit clock;
virtual fetch_intf fi;
virtual LC3_intf li;

covergroup cg @(posedge fi.clock);
BR: coverpoint fi.br_taken;
NPC: coverpoint fi.npc{bins s2 = {[16'h3000:16'h9000]};}
PC: coverpoint fi.pc{bins s3 = {[16'h3000:16'h9000]};}
INSTR: coverpoint fi.instrmem_rd{illegal_bins instr_bin={0};};
TADDR: coverpoint fi.taddr{bins s1 = {[16'h3000:16'h9000]};}
CROSS: cross fi.enable_fetch,fi.enable_updatePC;
endgroup

function new (virtual fetch_intf fi,virtual LC3_intf li);
this.fi = fi ;
this.li = li ;
cgfi = new;
cgli = new;
endfunction

task sample1();
cg.sample();
endtask

endclass
