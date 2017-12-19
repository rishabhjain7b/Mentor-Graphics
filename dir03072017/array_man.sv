
module array_man;
int f[6]='{0,2,7,9,11,2};
int d[]='{2,4,9,11,13};
int q[$]={2,4,11,7,14};
int a[int]={20:100,70:200,100:300,400:500};

initial
begin
	$display("%d %d %d",f.and,f.or,f.xor);
	$display("%d %d %d",d.and,d.or,d.xor);
	$display("%d %d %d",q.and,q.or,q.xor);
	$display("%p",f.max);
	$display("%p",f.min);
	$display("%d",f.sum);
	$display("%d",f.product);
	f.sort;
	$display("%p",f);
	f.rsort;
	$display("%p",f);
	$display("%p",f.unique);
	f.shuffle;
	$display("%p",f);
	f.reverse;
	$display("%p",f);
	$display("associative");
	$display("%d %d %d",a.and,a.or,a.xor);
	$display("%p",a.max);
	$display("%p",a.min);
	$display("%d",a.sum);
	$display("%d",a.product);
	$display("%p",a.unique);
	/*a.sort;
	$display("%p",a);
	a.rsort;
	$display("%p",a);
	a.shuffle;
	$display("%p",a);
	a.reverse;
	$display("%p",a);*/
end
endmodule
