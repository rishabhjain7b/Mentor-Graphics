module ques5;
int q[$],qp[$],qn[$];
int k=0,j=0;
initial
begin
	for(int i=0;i<50;i++)
	begin
		q.insert(i,100-$urandom_range(70,130));
	end
	#10;
	$display("\noriginal queue");
	
	$write("\n%p",q);
	for(int i=0;i<50;i++)
	begin
		if(q[i]>=0)
		begin
		qp[k]=q[i];
		k++;
		end
		else
		begin
		qn[j]=q[i];
		j++;
		end
	end
	$display("\npositive queue");
	$write("\n%p",qp);
	$display("\nnegative queue ");
	$write("\n%p",qn);
end
endmodule
	
