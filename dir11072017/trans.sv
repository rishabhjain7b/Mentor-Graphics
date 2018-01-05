
class Transaction;
rand bit [1:0]src,dst;
constraint c_dist{
src dist {0:=40, [1:3]:=60};
dst dist {0:/40, [1:3]:/50};
}
endclass

module trans;
Transaction t1;
initial
begin
	t1=new();
	repeat(10)
	begin
	if(t1.randomize())
	$display("src=%d dst=%d",t1.src,t1.dst);
	else 
	$display("fail");
	end
end
endmodule
