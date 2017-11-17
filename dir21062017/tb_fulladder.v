module tb_fulladder;

reg a,b,cin;
wire s,c;

fulladder f1(.a(a),.b(b),.cin(cin),.s(s),.c(c));

initial 
begin
	{a,b,cin}=3'b000;
	#10{a,b,cin}=3'b001;
	#10{a,b,cin}=3'b010;
	#10{a,b,cin}=3'b011;
	#10{a,b,cin}=3'b100;
	#10{a,b,cin}=3'b101;
	#10{a,b,cin}=3'b110;
	#10{a,b,cin}=3'b111;
end

initial
$monitor($time,"a=%b b=%b cin=%b s=%b c=%b", a,b,cin,s,c);
endmodule 
