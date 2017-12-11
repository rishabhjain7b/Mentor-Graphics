module queue1;

int q[$];
initial
begin
	q.push_front(0);
	q.push_front(1);
	q.push_front(2);
	q.push_front(3);
	
	for(int i=0;i<q.size();i++)
		$write("q[%0d]=%0d\t",i,q[i]);
		
	q.insert(2,15);
	q.delete(1);
	while(q.size()>0)
		$write("%0d\t",q.pop_back());
		
		
end
endmodule
