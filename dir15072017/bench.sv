program bench(input clk);
initial
forever
begin
	@(posedge clk)
	mod_pgm_test.di.siga<=mod_pgm_test.di.sigb;
end
endprogram
