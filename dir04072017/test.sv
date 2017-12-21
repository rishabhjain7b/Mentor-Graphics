// enhanced fork join

module test;
initial
begin
	fork
		begin
		#5 $display("1st child process executes at time t=%d",$time);
		end
		begin
		#10 $display("2nd child process executes at time t=%d",$time);
		end
	join_none
	$display("parent process executes at time t=%d",$time);
end
endmodule
