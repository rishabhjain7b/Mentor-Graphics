
class stimdata;
rand int size;
rand int sample[];
constraint c1{
	size>1;
	size<1000;
	}
endclass

module ques7;
stimdata s1=new();
initial
begin
	repeat(20)
	begin
	if(s1.randomize())
	begin
	s1.sample=new[s1.size];
	$display("size is %0d",s1.sample.size);
	/*foreach(s1.sample[i])
	s1.sample[i]=$random;
	*/
	$display("%p",s1.sample);
	end
	end
end
endmodule
	
