// moore machine for detecting 4 consecutive 0s(A=1) and 1s(B=1)

module mach_det
(input clk,rst,x,
 output reg A,B);
 
 parameter GN=4'b0000,
 	   GOT1=4'b0001,
 	   GOT11=4'b0010,
 	   GOT111=4'b0011,
 	   GOT1111=4'b0100,
 	   GOT0=4'b0101,
 	   GOT00=4'b0110,
 	   GOT000=4'b0111,
 	   GOT0000=4'b1000;


reg [3:0] pr_state,nxt_state;

always @(posedge clk)
begin
	if(!rst)
	pr_state<=GN;
	else
	pr_state<=nxt_state;
end

//next state combo
always @(pr_state,x)
begin
	case(pr_state)
	GN: if(x)
	    nxt_state=GOT1;
	    else
	    nxt_state=GOT0;
	    
	GOT1: if(x)
	    nxt_state=GOT11;
	    else
	    nxt_state=GOT0;
	    
	GOT11:  if(x)
	   	nxt_state=GOT111;
	    	else
	    	nxt_state=GOT0;
	    	
	GOT111: if(x)
	    	nxt_state=GOT1111;
	    	else
	    	nxt_state=GOT0;
	    	
	GOT1111: if(x)
	    	 nxt_state=GOT1111;
	    	 else
	    	 nxt_state=GOT0;
	    	 
	 GOT0:  if(x)
	    	nxt_state=GOT1;
	    	else
	    	nxt_state=GOT00;
	    	
	GOT00:  if(x)
	   	nxt_state=GOT1;
	    	else
	    	nxt_state=GOT000;
	    	
	GOT000: if(x)
	    	nxt_state=GOT1;
	    	else
	    	nxt_state=GOT0000;
	    	
	GOT0000: if(x)
	    	 nxt_state=GOT1;
	    	 else
	    	 nxt_state=GOT0000;

	default: nxt_state=GN;
	endcase
end

//output driving
always @(pr_state)
begin
	case(pr_state)
	GOT1111: B=1'b1;
	GOT0000: A=1'b1;
	default: {A,B}={2{1'b0}};
	endcase
end
endmodule

