program test_crosscoverage;
bit clk;
bit [1:0]bit1,bit2;

covergroup cg @(posedge clk);
bit1: coverpoint bit1;
bit2: coverpoint bit2;
bit1xbit2: cross bit1,bit2;
endgroup

cg cg1=new;

initial
begin
	clk=0;
	repeat(50)
	begin
		bit1=$random;
		bit2=$random;
		#5 clk=~clk;
		#5 clk=~clk;
	end
end
endprogram 
