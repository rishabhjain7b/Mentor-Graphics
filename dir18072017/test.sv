module test;
class abc;
function void display(input int a,input int b=0);
$display("%d %d",a,b);
endfunction
endclass

initial
begin
	abc obj=new;
	obj.display(3);
end
endmodule	
