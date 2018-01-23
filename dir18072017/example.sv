class Base;
rand integer a;
constraint range1 {a<100; a>0;}
endclass

class Extended extends Base;
constraint range {a==100;}
endclass

program example;
Extended obj_e;
Base obj_b;
initial
begin
	obj_e=new;
	obj_b=obj_e;
	for(int i=0;i<7;i++)
	begin
		if(obj_b.randomize())
		$display("success: a=%d",obj_b.a);
		else
		$display("fail");
	end
end
endprogram
