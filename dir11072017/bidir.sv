class bidir1;
rand bit [15:0]r,s,t;
constraint c1{
	r<t;
	s==t;
	t<10;
	s>5;
}
endclass

module bidir;
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
