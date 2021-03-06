module tb_fulladder;

bit a,b,cin,s,c;

fa f1(.a(a),.b(b),.cin(cin),.s(s),.c(c));

initial 
begin
	repeat(1000)
	begin
	#5 {a,b,cin}={$random,$random,$random};
	#5 {a,b,cin}={1'b0,1'b0,1'b0};
	#5 {a,b,cin}={1'b0,1'b0,1'b1};
	#5 {a,b,cin}={1'b0,1'b1,1'b0};
	#5 {a,b,cin}={1'b0,1'b1,1'b1};
	#5 {a,b,cin}={1'b1,1'b0,1'b0};
	#5 {a,b,cin}={1'b1,1'b0,1'b1};
	#5 {a,b,cin}={1'b1,1'b1,1'b0};
	#5 {a,b,cin}={1'b1,1'b1,1'b1};
	end	
end

initial
$monitor($time,"a=%b b=%b cin=%b s=%b c=%b", a,b,cin,s,c);
endmodule 
