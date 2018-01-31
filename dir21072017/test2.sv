

program test2;
class frame_t;
rand bit [7:0]src_addr;
rand bit [7:0]dst_addr;
constraint c{
	src_addr<=127;
	dst_addr>=128;
	}
task print();
begin
	$write("Source address %2d \n",src_addr);
	$write("Destination address %2d \n",dst_addr);
end
endtask
endclass

initial 
begin
	frame_t frame=new();
	integer j=0;
	$write("With Randomize value \n");
	j=frame.randomize();
	frame.print();
	
	$write("With Randomize with value \n");
	j=frame.randomize() with {
		src_addr>100;
		dst_addr<130;
		dst_addr>128;
	};
	frame.print();
end
endprogram
