module string_test;
string a="Hi";
string b="Ramesh";

initial
begin
	$display("%s",{5{a,"\n"}});
	$display("%s",{a,b});
end
endmodule

