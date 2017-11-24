// mealy machine for detecting 111

module seq_det_mealy_111
(input clk,rst,x,
 output reg y);
 
parameter GN=2'b00,
 	  GOT1=2'b01,
 	  GOT11=2'b10;
 	   
 reg [1:0]pr_state,nxt_state;

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
	    begin 
	    nxt_state=GOT1;
	    y=1'b0;
	    end
	    else
	    begin
	    nxt_state=GN;
	    y=1'b0;
	    end
	GOT1: if(x)
	      begin
	      nxt_state=GOT11;
	      y=1'b0;
	      end
	      else
	      begin
	      nxt_state=GN;
	      y=1'b0;
	      end
	GOT11:if(x)
	      begin
	      nxt_state=GOT1;
	      y=1'b1;
	      end
	      else
	      begin
	      nxt_state=GN;
	      y=1'b0;
	      end
	endcase
end

endmodule

