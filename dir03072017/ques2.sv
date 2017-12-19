// queue to associative

module ques2;
int q[$],a[int];
int k=0;
initial
begin
	for(int i=0;i<10;i++)
	q.insert(i,$urandom_range(500));
	
	$display("queue array");
	$display("%p",q);
	
	for(int i=0;i<10;i++)
	a[$urandom_range(500)]=q[i];
	
	$display("associative array");
	$display("%p",a);
	
	foreach(a[i])
	begin
		q[k]=a[i];
		k++;
	end
	$display("queue array");
	$display("%p",q);
end
endmodule
