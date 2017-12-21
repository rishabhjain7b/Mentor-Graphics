module ques3;

reg clk;

initial
init_task;

always 
begin
	task_clock;
end

task init_task;
clk=1'b0;
endtask


task task_clock;
begin
	forever
	begin
		#5 clk=!clk;
		$display("%b",clk);
	end	
end
endtask
	
initial
#500 $stop;

endmodule	
	

