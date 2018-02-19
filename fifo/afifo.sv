// asynchronous fifo code: first in first out

`define depth 16
`define width 4 
`define ptr $clog2(`depth)-1

module afifo
(input [`width-1:0]din,
 input wr_clk,wr_en,clear,rd_clk,rd_en,
 output full,empty,almost_full,almost_empty,wr_ack,wr_err,rd_ack,rd_err,
 output [`ptr:0]wr_count,rd_count,
 output [`width-1:0]dout);
 
 reg w_full=0,w_empty=1,w_almost_full=0,w_almost_empty=1;
 reg w_wr_ack,w_wr_err,w_rd_ack,w_rd_err;
 reg [`ptr:0]front,back,w_rd_count,w_wr_count;
 reg [`width-1:0]w_dout;
 reg [`width-1:0]ar[`depth-1:0];
 
 assign full=w_full,
 	empty=w_empty,
 	dout=w_dout,
 	almost_full=w_almost_full,
 	almost_empty=w_almost_empty,
 	wr_ack=w_wr_ack,
 	wr_err=w_wr_err,
 	rd_ack=w_rd_ack,
 	rd_err=w_rd_err,
 	rd_count=w_rd_count,
 	wr_count=w_wr_count;
 
 // write block
 always @(posedge wr_clk,negedge clear)
 begin
 	if(!clear)
 	begin
 		w_empty<=1;
 		w_full<=0;
 		w_almost_full<=0;
 		w_almost_empty<=1;
 		front<=0;
 		back<=0;
 		w_rd_count<=0;
 		w_wr_count<=0;
 		w_wr_ack<=0;
 		w_wr_err<=0;
 		w_rd_ack<=0;
 		w_rd_err<=0;
 	end
 	else
 	begin
 		if(wr_en)
 		begin
 			if(front==0 && back==0)
 			begin
 				back<=1;
 				front<=1;
 				ar[back]<=din;
 				w_empty<=1;
		 		w_full<=0;
		 		w_almost_full<=0;
		 		w_almost_empty<=1;
		 		w_rd_count<=w_rd_count;
		 		w_wr_count<=w_wr_count+1;
		 		if(ar[back]==din)
		 		begin
		 			w_wr_ack<=1;
		 			w_wr_err<=0;
		 		end
		 		else
		 		begin
		 			w_wr_ack<=0;
		 			w_wr_err<=1;
		 		end
 			end
 			
 			else if(!w_full)
 			begin
 				back<=back+1;
 				ar[back]<=din;
 				w_full<=(((back==`depth-1)&&(front==0))||(back==front-1))?1:0;
 				w_empty<=0;
 				front<=front;
 				w_almost_full<=(((back==`depth-2)&&(front==0))||(back==front-2)||(w_full==1))?1:0;
		 		w_almost_empty<=0;
		 		w_rd_count<=w_rd_count;
		 		w_wr_count<=w_wr_count+1;
		 		if(ar[back]==din)
		 		begin
		 			w_wr_ack<=1;
		 			w_wr_err<=0;
		 		end
		 		else
		 		begin
		 			w_wr_ack<=0;
		 			w_wr_err<=1;
		 		end
 			end
 			
 			else
 			begin
 				back<=back;
 				ar[back]<=ar[back];
 				w_full<=w_full;
 				w_empty<=w_empty;
 				front<=front;
				w_almost_full<=w_almost_full;
		 		w_almost_empty<=w_almost_empty;
		 		w_rd_count<=w_rd_count;
		 		w_wr_count<=w_wr_count;
		 		if(ar[back]==din)
		 		begin
		 			w_wr_ack<=1;
		 			w_wr_err<=0;
		 		end
		 		else
		 		begin
		 			w_wr_ack<=0;
		 			w_wr_err<=1;
		 		end
 			end
 		end		
 	end
 end
 
// read block
 always @(posedge rd_clk,negedge clear)
 begin
 	if(!clear)
 	begin
 		w_empty<=1;
 		w_full<=0;
 		w_almost_full<=0;
 		w_almost_empty<=1;
 		front<=0;
 		back<=0;
 		w_rd_count<=0;
 		w_wr_count<=0;
 		w_wr_ack<=0;
 		w_wr_err<=0;
 		w_rd_ack<=0;
 		w_rd_err<=0;
 	end
 
 	else
 	begin
 		if(rd_en)
 		begin
 			if(w_empty==1)
 			begin
 				back<=back;
 				ar[front]<=ar[front];
 				w_full<=w_full;
 				w_empty<=w_empty;
 				front<=front;
				w_almost_full<=w_almost_full;
		 		w_almost_empty<=w_almost_empty;
		 		w_dout<=w_dout;
		 		w_rd_count<=w_rd_count;
		 		w_wr_count<=w_wr_count;
		 		if(w_dout==ar[front])
		 		begin
		 			w_wr_ack<=1;
		 			w_wr_err<=0;
		 		end
		 		else
		 		begin
		 			w_wr_ack<=0;
		 			w_wr_err<=1;
		 		end

 			end
 			
 			else
 			begin
				front<=front+1;
 				w_dout<=ar[front];
 				w_empty<=(front==back)?1:0;
 				w_full<=0;
 				back<=back;
				w_almost_full<=0;
				w_almost_empty<=((front==back-1)||(w_empty==1))?1:0;;
				w_rd_count<=w_rd_count+1;
				w_wr_count<=w_wr_count;
				if(ar[front]==dout)
		 		begin
		 			w_rd_ack<=1;
		 			w_rd_err<=0;
		 		end
		 		else
		 		begin
		 			w_rd_ack<=0;
		 			w_rd_err<=1;
		 		end 			
			end
  		end	
 	end
 end
 endmodule
