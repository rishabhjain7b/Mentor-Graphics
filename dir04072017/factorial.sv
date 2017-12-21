// automatic and static function

module factorial
(input [2:0]a,
 output [13:0]z);
 
 assign z=fact(a);
 
function static integer fact
(input [2:0]a);
begin
	if(a==0)
	fact=1;
	else
	fact=fact(a-1)*a;
end
endfunction
endmodule
