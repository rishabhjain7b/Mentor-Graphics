
module assert_demo
(input a,b,s,
 output reg y);
 
 always_comb
 begin
 	assert(s!==1'bx)
 	else
 		$fatal("sel is x");
 		
 	if(s) y=b;
 	else y=a;
 end
 endmodule
