// question 2

class C;
rand byte A[4];
constraint C1{ foreach (A[i]) A[i]inside {2,4,8,16};}
constraint C2{foreach (A[j]) A[j]> 2*j;}
endclass

module ques2;
C p=new();
initial 
begin
	repeat(5)
	begin
	if(p.randomize())
	$display("%p",p);
	else
	$display("fail");
	end
end
endmodule
