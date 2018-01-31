class equiv;
rand bit[2:0] d,e;
constraint c{(d==7)<->(e==2);}
endclass

module equi_const;
equiv obj=new();

initial
begin
	repeat(10)
	begin
		if(obj.randomize())
		$display("d=%0d | e=%0d",obj.d,obj.e);
		else
		$display("fail");
	end
end
endmodule
