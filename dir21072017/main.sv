
class frame_t;
bit [7:0]low;
rand bit [7:0]med,hi;
task print();
begin
	$write("low=%0d | med=%0d | hi=%0d \n",low,med,hi);
end
endtask
endclass
program main;
initial 
begin
	frame_t frame=new();
	integer j=0;
	$write("Without Randomize value \n");
	frame.print();
	
	$write("With Randomize all \n");
	j=frame.randomize();
	frame.print();
	
	$write("With Randomize med \n");
	j=frame.randomize(med);
	frame.print();
	
	$write("With Randomize med and hi \n");
	j=frame.randomize(med,hi);
	frame.print();

	$write("With Randomize low \n");
	j=frame.randomize(low);
	frame.print();
	
	$write("With Randomize low,med and hi \n");
	j=frame.randomize(low,med,hi);
	frame.print();

end
endprogram
