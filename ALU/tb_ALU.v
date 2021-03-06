module tb_ALU #(parameter n=4);
reg [n-1:0]a,b;
reg [2:0]sel;
wire [n-1:0]o;
wire co;

ALU_nbit alu(.a(a),.b(b),.sel(sel),.o(o),.co(co));

integer i=0,j=0,k=0;

initial
begin

for(i=0;i<(8);i=i+1)
begin
	for(j=0;j<(2**n);j=j+1)
	begin
		for(k=0;k<(2**n);k=k+1)
		begin
		sel=i;
		a=k;
		b=j;
		#5
		$display("sel=%d a=%d b=%d co=%d o=%d",sel,a,b,co,o);
		end
	end
end

repeat(100)
begin
		sel=$random;
		a=$random;
		b=$random;
		#5
		$display("sel=%d a=%d b=%d co=%d o=%d",sel,a,b,co,o);
end

begin
	sel = 3'b00z;
	a=$urandom_range(0,15);
	b=$urandom_range(0,15);
	sel = 3'b0z1;
	a=$urandom_range(0,15);
	b=$urandom_range(0,15);	
	sel = 3'bz1z;
	a=$urandom_range(0,15);
	b=$urandom_range(0,15);
	sel = 3'b1zz;
	a=$urandom_range(0,15);
	b=$urandom_range(0,15);
	sel = 3'bz00;
	a=$urandom_range(0,15);
	b=$urandom_range(0,15);
end
	
end

endmodule
