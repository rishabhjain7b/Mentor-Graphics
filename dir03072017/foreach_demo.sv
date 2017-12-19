module foreach_demo;

int d[7]='{5,15,25,85,95,100,78};

// int f[5]='{5,15,25,85,95,100};

initial
begin
	foreach(d[i])
	$display("%d %d",i,d[i]);
end
endmodule

