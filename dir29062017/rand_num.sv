// random odd numbers 

module rand_num;
logic [6:0]od,ev,x,x1;

initial
begin
	repeat(50)
	begin
		x= $urandom_range(1,100);
		if (x[0]==0) 
		ev=x; 
		#10;
	end
end

initial
begin
	repeat(50)
	begin
		x1= $urandom_range(1,100);
		if (x1[0]==1)
		od=x1; 
		#15;
	end
end

initial
$monitor($time," ev=%d, od=%d",ev,od);

endmodule

	 
