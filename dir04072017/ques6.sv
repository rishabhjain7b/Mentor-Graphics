module ques6;

longint ar[longint];
longint index;
longint i,j;

initial
begin
	index=1;
	repeat(64)
	begin
		ar[index]=index;
		index=index<<1;
	end
	ar.first(i);
	$display("first: %d %d",i,ar[i]);
	ar.last(i);
	$display("last: %d %d",i,ar[i]);
	foreach(ar[j])
	begin
		$write("%d %d\t",j,ar[j]);
		//ar.next(j);
	end
	
end
endmodule
