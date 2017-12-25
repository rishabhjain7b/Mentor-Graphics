module test;

reg [3:0]r1,r2;

initial
begin
	for(int i=0;i<10;i++)
	begin
		std::randomize(r1,r2) with{
		r1<r2;
		r1+r2==4;
		r1>8;
		};
		$display("r1=%0d,r2=%0d",r1,r2);
	end
end
endmodule	
