// driver class

class driver;
packet pkt;
mailbox #(packet)gen_drv;
mailbox #(packet)drv_sb;
virtual intf i;
function new(mailbox #(packet)gen_drv,mailbox
#(packet)drv_sb,virtual intf i);
this.gen_drv=gen_drv;
this.drv_sb=drv_sb;
this.i=i;
endfunction
task run;
gen_drv.get(pkt);
drv_sb.put(pkt);
i.clock =pkt.clock;
i.reset =pkt.reset;
i.enable_updatePC =pkt.enable_updatePC;
i.enable_fetch =pkt.enable_fetch;
i.taddr =pkt.taddr;
i.br_taken =pkt.br_taken;
endtask
endclass

