module queue2;

int q[$]={0,7,9,11,13};
initial
begin
	q={11,q};
	$display("%p",q);
	q={q,21};
	$display("%p",q);
	q={q[0:1],85,q[2:$]};
	$display("%p",q);
	q=q[1:$];
	$display("%p",q);
	q=q[0:$-1];
	$display("%p",q);
	q={};
	$display("%p",q);		
end
endmodule
