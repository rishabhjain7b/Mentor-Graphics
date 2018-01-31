class quiz1;
rand bit[2:0] a,b,c;
constraint c1{
	a inside {[b:c]};
	}
endclass

module quiz;
quiz1 q=new;
initial
begin
	repeat(20)
	begin
		if(q.randomize())
		$display("a=%0d, b=%0d, c=%0d",q.a,q.b,q.c);
		else
		$display("failed");
	end
end

endmodule
