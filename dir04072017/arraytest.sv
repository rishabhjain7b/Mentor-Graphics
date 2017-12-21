module arraytest;

int q[$];
initial
begin
	foreach(q[i])
	$display("%d %d",i,q[i]);
end

int d[];
initial
begin
	foreach(d[i])
	$display("%d %d",i,d[i]);
end

int a[int];
initial
begin
	foreach(a[i])
	$display("%d %d",i,a[i]);
end

int f[10];
initial
begin
	foreach(f[i])
	$display("%d %d",i,f[i]);
end

endmodule

