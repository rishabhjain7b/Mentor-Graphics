// implication with inside operator

class packet;
typedef enum {read,write}RW;
rand reg [31:0]addr;
rand reg [31:0]data;
rand RW rw;
constraint c0{
	(rw==read)->addr inside {[32'h0:32'h1000]};
	(rw==write)->addr inside {[32'h3000:32'h20000]};
	}
endclass

module test;
packet pkt=new();
initial
begin
	repeat(10)
	begin
	if(pkt.randomize())
	$display("pkt.rw.name=%s,pkt.addr=%d,pkt.data=%0d",pkt.rw.name,pkt.addr,pkt.data);
	else
	$display("fail");
	end
end
endmodule
	
