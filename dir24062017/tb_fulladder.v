// Test bench for full adder (i/o based)

module tb_fulladder;
reg a,b,cin;
wire s,c;

fulladder f1(.a(a),.b(b),.cin(cin),.s(s),.c(c));
integer fd,i;

initial
fd=$fopen("fulladder.txt");

initial
begin
	for(i=0;i<8;i=i+1)
	#10 {a,b,cin}=i;
end

initial
$fmonitor(fd,$time,"a=%b b=%b cin=%b s=%b c=%b",a,b,cin,s,c);

endmodule 
