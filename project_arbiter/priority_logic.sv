// priority logic(encoder) for ARBITER

module priority_logic #(parameter n=4)
(input [n-1:0]in,
 input en,
 output [n-1:0]out);
 

always @(in,en)
begin
	integer i=0;
	if(!en)
	out=0;
	else
	begin
		for(i=0;i<n;i=i+1)
		begin
			if(in[i])
			begin
				out[i]=1;
				i=n;
			end
		end
	end
end
endmodule

