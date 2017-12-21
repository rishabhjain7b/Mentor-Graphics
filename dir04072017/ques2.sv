module ques2;

task countone;
input [7:0]n;
automatic int count=0;
begin
	for(int i=0;i<8;i++)
	begin
		if(n[i])
		count++;
		else
		continue;
	end
	$display("number of ones=%d",count);
end
endtask
	
initial
countone(8'b00100111);

endmodule	
	

