

program test1;
class frame_t;
rand bit [7:0]src_addr;
rand bit [7:0]dst_addr;
task print();
begin
	$write("Source address %2x \n",src_addr);
	$write("Destination address %2x \n",dst_addr);
end
endtask
endclass

initial 
begin
	frame_t frame=new();
	integer j=0;
	$write("Without Randomize value \n");
	frame.print();
	
	$write("With Randomize value \n");
	j=frame.randomize();
	frame.print();
	
	$write("With Randomize OFF & Randomize \n");
	frame.rand_mode(0);
	j=frame.randomize();
	frame.print();
	
	$write("With Randomize ON & Randomize \n");
	frame.rand_mode(1);
	j=frame.randomize();
	frame.print();

	$write("With Randomize OFF on dst_addr & Randomize \n");
	frame.dst_addr.rand_mode(0);
	j=frame.randomize();
	frame.print();

	$write("With Randomize OFF on src_addr & Randomize \n");
	frame.src_addr.rand_mode(0);
	j=frame.randomize();
	frame.print();
end
endprogram
