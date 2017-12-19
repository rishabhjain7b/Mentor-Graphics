
module array_assoc;
bit [31:0]mem[*];
int i;

initial
begin
	mem[23]=57;
	mem[100]=70;
	mem[200]=80;
	mem[250]=210;
	mem[501]=502;
	$display("%d ",mem.num);
	mem.first(i);
	$display("first index is %d",i);
	mem.next(i);
	$display("next index is %d",i);
	mem.last(i);
	$display("last index is %d",i);
	mem.prev(i);
	$display("prev index is %d",i);
	
	i=45;
	if(mem.exists(i))
	$display("index found");
	else
	$display("index not found");
	
	i=100;
	if(mem.exists(i))
	$display("index found");
	else
	$display("index not found");
	
	mem.delete(23);
	$display("array is %p",mem);
	
	mem.delete(4);
	$display("array is %p",mem);
	
	mem.delete();
	$display("array is %p",mem);

	end
endmodule
