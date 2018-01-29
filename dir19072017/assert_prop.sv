

module assert_prop;
bit clk,rst=1;
bit a=0,rdy,done,ack,start,sent;

initial
begin
	assert property (@(posedge clk) rst |-> ##20 $fell(rst));
	
	
	assert property	(@(posedge clk) $rose(a) |-> ##2 $rose(a));
	 
	
	assert property (@(posedge clk) $rose(rdy) |-> $fell(rst));
	 
	
	assert property (@(posedge clk) (sent) |=> (done));
	 
	
	assert property (@(posedge clk) (start) |-> ##2 (sent)) |-> ##3 (ack));
end 
endmodule
