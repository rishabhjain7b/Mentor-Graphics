// dynamic to associative

module ques1;
int d[],a[int];
int k=0;
initial
begin
	d=new[10];
	for(int i=0;i<10;i++)
	d[i]=$urandom_range(500);
	
	$display("dynamic array");
	$display("%p",d);
	
	for(int i=0;i<10;i++)
	a[$urandom_range(500)]=d[i];
	
	$display("associative array");
	$display("%p",a);
	
	foreach(a[i])
	begin
		d[k]=a[i];
		k++;
	end
	$display("dynamic array");
	$display("%p",d);
end
endmodule
