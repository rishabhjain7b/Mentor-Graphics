module tb_alu_const_random #(parameter n=4);

reg [n-1:0]a,b;
reg [2:0]sel;
wire [n-1:0]s;
wire co;
int i,j;

alu DUT (.a(a),.b(b),.sel(sel),.s(s),.co(co));
initial
begin
	for(i=0;i<8;i++)
	begin
		sel=$urandom_range(8);
		for(j=0;j<10;j++)
		begin
		#10 a=$urandom_range(100);
		b=$urandom_range(900);
		end
		#10;
	end

	/*sel=3'b11x;
	#10{a,b}=8'b0000_0000;
	#10{a,b}=8'b0001_0001;
	#10{a,b}=8'b0010_0010;
	#10{a,b}=8'b0011_0011;
	#10{a,b}=8'b0100_0100;
	#10{a,b}=8'b0101_0101;
	#10{a,b}=8'b0110_0110;
	#10{a,b}=8'b0111_0111;
	#10{a,b}=8'b1000_1000;
	#10{a,b}=8'b1001_1001;
	#10{a,b}=8'b1010_1010;
	#10{a,b}=8'b1011_1011;
	#10{a,b}=8'b1100_1100;
	#10{a,b}=8'b1101_1101;
	#10{a,b}=8'b1110_1110;
	#10{a,b}=8'b1111_1111;*/

end

initial 
$monitor($time,"a=%b b=%b sel=%b s=%b co=%b",a,b,sel,s,co);
endmodule 
