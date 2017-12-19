module array_test;



// int f[5]='{5,15,25,85,95,100};

initial
begin
	int d[*]='{20:5,70:15,87:25,100:85};
	foreach(d[i])
	$display("%d %d",i,d[i]);
end
endmodule

