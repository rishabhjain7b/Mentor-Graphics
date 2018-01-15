module auto_bound;
mailbox mbx;
initial
begin 
	mbx=new(1);
	fork
		for(int i=0;i<4;i++)
		begin
		$display("@%0d: producer: putting %0d",$time,i);
		mbx.put(i);
		$display("@%0d: producer: put(%0d) done %0d",$time,i,i);
		end
		
		repeat(3)
		begin
		int j;
		#4ns mbx.get(j);
		$display("@%0d: consumer: get %0d",$time,j);
		end
	join
end
endmodule
