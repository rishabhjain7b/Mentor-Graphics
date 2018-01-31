//works for dynamic array, queue.
// it doesnt work for associative array

program main1;
class frame_t;
rand bit [31:0]d[$];
constraint d_size{d.size() inside {[1:10]};}
task print();
begin
	$display("size=%0d",d.size());
end
endtask
endclass

initial 
begin
	frame_t frame=new();
	repeat(10)
	begin
		if(frame.randomize())
		frame.print();
		else
		$display("fail");
	end
end
endprogram
