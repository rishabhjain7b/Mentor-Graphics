

class frame_detector;
rand bit [7:0]src_port;
rand bit [7:0]des_port;
constraint c {
	src_port inside {[8'h0:8'h10],8'h14,8'h18};
	!(des_port inside {[8'h4:8'hff]});
	}
endclass

module frame;
frame_detector f1=new();
initial 
begin
	repeat(10)
	begin
	if(f1.randomize())
	$display("src_port=%h,des_port=%h",f1.src_port,f1.des_port);
	else
	$display("fail");
	end
end
endmodule 
