// synchronous fifo code: first in first out

`define depth 16
`define width 4 
`define ptr $clog2(`depth)+1

module fifo
(input [`width-1:0]din,
 input clk,rst_n,
 input rd_en,wr_en,
 output full,empty,
 output reg [`width-1:0]dout);
 
 reg w_full=0,w_empty=1;
 reg [`ptr:0]front,back;
 reg [`width-1:0]w_dout;
 reg [`width-1:0]ar[`depth:0];
 
 assign full=w_full,
 	dout=w_dout,
 	empty=w_empty;
 
 always @(posedge clk,negedge rst_n)
 begin
 	if(!rst_n)
 	begin
 		w_empty<=1;
 		w_full<=0;
 		front<=0;
 		back<=0;
 		w_dout<=0;
 	end
 	else
 	begin
 		if(wr_en)
 		begin
 			if(front==0 && back==0)
 			begin
 				back<=1;
 				front<=1;
 				ar[1]<=din;
 				w_empty<=0;
 				w_full<=0;
 				w_dout<=w_dout;
 			end
 			
 			else if(!w_full)
 			begin
 				back<=back+1;
 				ar[back+1]<=din;
 				w_full<=(back+1==`depth)?1:0;
 				w_empty<=0;
 				front<=front;
 				w_dout<=w_dout;
 			end
 			
 			else
 			begin
 				back<=back;
 				ar[back]<=ar[back];
 				w_full<=w_full;
 				w_empty<=0;
 				front<=front;
 				w_dout<=w_dout;
 			end
 		end
 			
 		else if(rd_en)
 		begin
 			if((front==back) || (w_empty==1))
 			begin
 				w_dout<=ar[front];
 				front<=0;
 				back<=0;
 				w_empty<=1;
 				w_full<=0;
 			end
 			
 			else
 			begin
				front<=front+1;
 				w_dout<=ar[front];
 				w_empty<=(front+1==`depth)?1:0;
 				w_full<=0;
 				back<=back;
 			end
 
  		end	
 		
 	end
 end
 endmodule
 
 
