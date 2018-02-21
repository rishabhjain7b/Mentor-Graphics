// environment class

class environment;
mailbox #(packet)gen_drv;
//mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
mailbox #(packet)mon_sb2;
virtual intf i;
virtual rintf ri;
generator g1;
coverage c1;
driver d1;
monitor m1;
scoreboard s1;

function new(virtual intf i,virtual rintf ri);
this.i=i;
this.ri=ri;
endfunction

function build;
gen_drv=new();
//drv_sb=new();
mon_sb=new();
mon_sb2=new();
g1=new(gen_drv);
d1=new(gen_drv,ri,i);
m1=new(mon_sb/*,mon_sb2*/,ri,i);
s1=new(mon_sb/*,mon_sb2*/);
c1=new(i);
endfunction

task run;
fork
g1.run();
d1.run();
c1.sample1();
m1.run();
s1.run();
join
endtask

endclass

