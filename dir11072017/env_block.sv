// environment block containing packet, generator, driver


class packet;
rand bit[2:0]a;
//constraint c1 {a>50;}
rand bit[5:0]b;
endclass

class generator;
packet pkt=new();
mailbox mb_gen=new();

task run;
repeat(5)
begin
	if(pkt.randomize())
	begin
		mb_gen.put(pkt);
		$display($time,"producer: %0d %0d",pkt.a,pkt.b);
		#5;
	end
end
endtask
endclass

class driver;
packet pkt;
mailbox mb_drv=new();
mailbox mb_drv_sb=new();

task run;
repeat(10)
begin
	mb_drv.get(pkt);
	$display($time,"getting: %0d %0d",pkt.a,pkt.b);
	mb_drv_sb.put(pkt);
	$display($time,"putting SB: %0d %0d",pkt.a,pkt.b);
	#5;
end
endtask
endclass

module env_block;
generator g1=new();
driver d1=new();
initial
begin
	d1.mb_drv=g1.mb_gen;
	fork
		g1.run;
		d1.run;
	join
	$stop;
end
endmodule
