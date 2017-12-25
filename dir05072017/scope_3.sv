// randomize function (inline and scope)

module scope_3;
integer a,b;
initial
begin 
	for(int i=0;i<6;i++)
	if(randomize(a,b) with {a<-1;b>1;b<-1;})
	$display("success %d %d",a,b);
	else
	$display("failed");
	$finish;
end
endmodule

