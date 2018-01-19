// question 3

class C;
rand bit x;
rand bit [1:0] y;
constraint c_xy {y inside {[x:3]};}
constraint c {solve x before y;}
endclass

module ques3;
C p=new();
initial 
begin
	repeat(10)
	begin
	if(p.randomize())
	$display("%p",p);
	else
	$display("fail");
	end
end
endmodule
