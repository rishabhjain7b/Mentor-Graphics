// top module

`include "fetch_package.sv"

module fetch_top;
bit clock,reset;

intf i(clock,reset);
rintf ri(clock,reset);

fetch_test TEST (ri,i);

fetch DUT (.clock(ri.clock), .reset(ri.reset), .enable_updatePC(ri.enable_updatePC), .enable_fetch(ri.enable_fetch), .pc(ri.pc), .npc(ri.npc), .instrmem_rd(ri.instrmem_rd), .taddr(ri.taddr), .br_taken(ri.br_taken));

fetch_dummy DUMMY (.clock(i.clock), .reset(i.reset), .enable_updatePC(i.enable_updatePC), .enable_fetch(i.enable_fetch), .pc(i.pc), .npc(i.npc), .instrmem_rd(i.instrmem_rd), .taddr(i.taddr), .br_taken(i.br_taken));

always #5 clock=!clock;

always #100 reset=!reset;
 
endmodule

