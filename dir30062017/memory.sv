module memory;

reg [7:0]mem[0:255];

initial
begin
	for(int i=0;i<256;i++)
	begin
		mem[i]=i;
		#10 $display("addr=%d, data=%d",i,mem[i]);
		mem[i]<=0;
		#10 $display("addr=%d, data=%d",i,mem[i]);
	end
end
endmodule
