module rand_gen;

reg [4:0]seed=8;
reg [2:0]value;
initial
begin
	//for(seed=0;seed<20;seed++)
	//begin
		$display("%d seed",seed);
		repeat(10)
		begin
			value=$urandom;
			$write("%0d ",value);
		end
		$display("\n");
	//end
end
endmodule
