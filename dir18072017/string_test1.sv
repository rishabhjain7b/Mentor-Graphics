module string_test1;
string s="SystemVerilog";

initial
begin
	$display("%s",s.getc(0));
	$display(s.toupper());
	s={s,"3.1b"};
	$display("%s",s);
	s.putc(s.len()-1,"a");
	$display("%s",s);
	$display(s.substr(2,5));
end
endmodule

