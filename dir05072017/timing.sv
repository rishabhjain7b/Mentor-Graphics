`timescale 1ns/1ns

module timing;
timeunit 1ns;
timeprecision 1ps;
initial
 
begin
	
	#1ns $display("time is %t",$realtime);
	#1ps $display("time is %t",$realtime);
	#1fs $display("time is %t",$realtime);
	#1s $display("time is %t",$realtime);	
end

final
begin
	$display("final block",$time);
	$display("no delays allowed here");
//	#10;
end

endmodule
