//bidirectional constraint

class bidir1;
rand logic [15:0]b,c,d;
constraint c1{
	b<d;
	c==b;
	d<30;
	c>=25;
}
endclass

module bidc;
bidir1 t1;
initial
begin
	t1=new();
	repeat(10)
	begin
	if(t1.randomize())
	$display("%p",t1);
	else 
	$display("fail");
	end
end
endmodule
