`timescale 1ns/1000ps

module tb_fulladder;

logic a,b,cin,s,c;

fulladder f1(.a(a),.b(b),.cin(cin),.s(s),.c(c));

initial 
begin
	{a,b,cin}=3'b000;
	#5.25 {a,b,cin}=3'b001;
	#6.23 {a,b,cin}=3'b010;
	
end

initial
$monitor($realtime,"a=%b b=%b cin=%b s=%b c=%b", a,b,cin,s,c);
endmodule 
