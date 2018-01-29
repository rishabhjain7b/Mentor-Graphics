module set_mem;

class frame_t;
rand bit [7:0]src_port;
rand bit [7:0]des_port;
constraint c {src_port inside {[8'h0:8'hA],8'h14,8'h18};
		!(des_port inside {[8'h4:8'hFF]});}

function void pre_randomize();
begin
	$display("src_port_pre: %0x",src_port);
	$display("des_port_pre: %0x",des_port);
end
endfunction

function void post_randomize();
begin
	$display("src_port_post: %0x",src_port);
	$display("des_port_post: %0x",des_port);
end
endfunction
endclass

initial
begin
	frame_t frame=new();
	integer i,j=0;
	for(j=0;j<8;j++)
	begin
		$display("randomize");
		i=frame.randomize();
	end
end
endmodule	
