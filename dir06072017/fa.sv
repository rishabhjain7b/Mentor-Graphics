module fa
(input a,b,cin,
 output reg s,c);
 
 always @(a,b,cin)
 begin
 	if(a==0 && b==0 && cin==0)
 	{s,c}={1'b0,1'b0};
 	
	else if(a==0 && b==0 && cin==1)
 	{s,c}={1'b1,1'b0};
 
	else if(a==0 && b==1 && cin==0)
 	{s,c}={1'b1,1'b0};
 	
 	else if(a==0 && b==1 && cin==1)
 	{s,c}={1'b0,1'b1};
 	
 	else if(a==1 && b==0 && cin==0)
 	{s,c}={1'b1,1'b0};
 	
 	else if(a==1 && b==0 && cin==1)
 	{s,c}={1'b0,1'b1};
 	
 	else if(a==1 && b==1 && cin==0)
 	{s,c}={1'b0,1'b1};
 	
 	else if(a==1 && b==1 && cin==1)
 	{s,c}={1'b1,1'b1};
 end
 endmodule 
