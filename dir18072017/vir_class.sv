virtual class packet;
bit [31:0]addr;
function disp();
$display("addr=%d",addr);
endfunction
endclass

module vir_class;
initial
begin
	packet p;
	p=new;
	p.disp();
end
endmodule
