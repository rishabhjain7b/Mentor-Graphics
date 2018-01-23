program binsof_test;
bit clk;
bit [7:0]bit1,bit2;

covergroup cg @(posedge clk);
a: coverpoint bit1{
	bins a1={[0:63]};
	bins a2={[64:127]};
	bins a3={[128:191]};
	bins a4={[192:255]};
	}
b: coverpoint bit2{
	bins b1={0};
	bins b2={[1:84]};
	bins b3={[85:169]};
	bins b4={[170:255]};
	}
c: cross a,b{
	bins c1= !binsof(a) intersect {[100:200]};
	bins c2= binsof(a.a2) || binsof(b.b2);
	bins c3= binsof(a.a1) || binsof(b.b4);
	}
endgroup

cg cg1=new;

initial
begin
	clk=0;
	repeat(5000)
	begin
		bit1=$random;
		bit2=$random;
		$display("%d %d %d",cg1.a,cg1.b,cg1.c);
		#5 clk=~clk;
		#5 clk=~clk;
	end
end
endprogram 
