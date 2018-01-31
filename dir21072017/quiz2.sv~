class quiz1;
rand integer v,w;
integer fives[0:3]={5,10,15,20};
constraint c1{
	!(v inside {fives});
	w inside {fives};
	}
endclass

module quiz2;
quiz1 q=new;
initial
begin
	repeat(20)
	begin
		if(q.randomize())
		$display("v=%0d, w=%0d",q.v,q.w);
		else
		$display("failed");
	end
end

endmodule
