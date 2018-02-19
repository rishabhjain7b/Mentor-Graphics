// synchronous lifo code: last in first out

module lifo
(input [3:0]din,
 input clk,rst_n,
 input rd_en,wr_en,
 output reg [3:0]dout);
 
 reg full=0,empty=0;
 reg [3:0]ptr;
 reg [3:0]ar[15:0];
 reg [3:0]w_dout;
 
 always @(posedge clk,negedge rst_n)
 begin
 	if(!rst_n)
 	begin
 		rd_en<=0;
 		wr_en<=0;
 		empty<=1;
 		full<=0;
 		ptr<=0;
 	end
 	else
 	begin
 		if(wr_en)
 		begin
 			if(!full)
 			begin
 				ptr<=ptr+1;
 				ar[ptr]<=din;
 				full<=(ptr+1==15)?1:0;
 			end
 			else
 			begin
 				ptr<=ptr;
 				ar[ptr]<=ar[ptr];
 			end
 		end	
 		else if(rd_en)
 		begin
 			if(!empty)
 			begin
				ptr<=ptr-1;
 				dout<=ar[ptr];
 				empty<=(ptr-1==0)?1:0;
 			end
 			else
 			begin
 				ptr<=ptr;
 				ar[ptr]<=ar[ptr];
				dout<=dout;
 			end
 		end	
 		
 	end
 end
 endmodule
 
 
