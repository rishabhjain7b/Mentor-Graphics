// moore machine for detecting 1101

module seq_det_moore_1101
(input clk,rst,x,
 output reg y);
 
 parameter GN=3'b000,
 	   GOT1=3'b001,
 	   GOT11=3'b010,
 	   GOT110=3'b011,
 	   GOT1101=3'b100;

reg [2:0] pr_state,nxt_state;

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
	    nxt_state=GN;
	GOT1: if(x)
	    nxt_state=GOT11;
	    else
	    nxt_state=GN;
	GOT11:  if(x)
	   	nxt_state=GOT11;
	    	else
	    	nxt_state=GOT110;
	GOT110: if(x)
	    	nxt_state=GOT1101;
	    	else
	    	nxt_state=GN;
	GOT1101: if(x)
	    	 nxt_state=GOT11;
	    	 else
	    	 nxt_state=GN;
	default: nxt_state=GN;
	endcase
end

//output driving
always @(pr_state)
begin
	case(pr_state)
	GOT1101: y=1'b1;
	default: y=1'b0;
	endcase
end
endmodule

