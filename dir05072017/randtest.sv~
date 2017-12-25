
module randtest;
int x,a=0,b=0,c=0;
initial
begin
	for(int i=1;i<100;i++)
	begin
		randcase
		3: begin
		   x=$urandom_range(10,5); 
		   a++;
		   end
		1: begin
		   x=$urandom_range(19,10); 
		   b++;
		   end
		4: begin
		   x=$urandom_range(100,50); 
		   c++;
		   end
		endcase
		$write("%0d \t",x);
	end
	$display("3:range(10,5)=%d",a);
	$display("1:range(19,10)=%d",b);
	$display("4:range(100,50)=%d",c);	
	$display();
end
endmodule

