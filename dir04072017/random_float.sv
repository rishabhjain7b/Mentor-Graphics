// random float

module random_float;
real a;
initial
begin
	repeat(5)
	begin
		#1;
		a=$bitstoreal({$urandom,$urandom});
		$display("%g",a);
	end
end
endmodule
