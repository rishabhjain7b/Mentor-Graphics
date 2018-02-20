//Arbiter code 

module arbiter #(parameter n=4)
( input reset,ack,clock,
  input [n-1:0]req,
  output [n-1:0]grant);
 
reg ring_in;
reg [n-1:0]token;
genvar i;
 
dff d1 (.clock(clock),.din(ack),.dout(ring_in));

ring_counter d2 (.clock(ring_in),.reset_n(reset),.dout(token));

generate
	for(i=0;i<n;i=i+1);
	begin: f1
		priority_logic d3 (
 