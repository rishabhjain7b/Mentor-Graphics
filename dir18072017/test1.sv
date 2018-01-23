module test1;
class abc;
static int sum;
function int calc(input int a,input int b);
this.sum=a+b;
endfunction
endclass

initial 
begin
	abc obj1=new;
	abc obj2=new;
	
	obj1.sum=obj1.calc(10,20);
	obj2.sum=obj2.calc(30,40);
	
	$display("%d %d",obj1.sum,obj2.sum);
end
e
