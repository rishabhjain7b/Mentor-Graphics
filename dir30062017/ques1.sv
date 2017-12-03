module ques1;
shortint mem[],q[$];

int a[4:0]='{34,56,87,100,500};

initial
begin
	mem=new[501];
	for(int i=0;i<5;i++)
	mem[a[i]]=$urandom_range(100);
	#10;
	for(int i=0;i<501;i++)
	$write("%d",mem[i]);
	$display("size=%d",mem.size);
	q=mem;
	q.delete(87);
	mem=q;
	for(int i=0;i<501;i++)
	$write("%d",mem[i]);
	$display("size=%d",mem.size);
end
endmodule

