module add_comp
(input [3:0]a,b,
 output [4:0]y,
 output [3:0]z);
 
 assign y=adder(a,b),
 	z=comp(a,b);
 	
 function [4:0]adder
 (input [3:0]a,b);
 adder=a+b;
 endfunction
 
  function [3:0]comp
 (input [3:0]a,b);
 comp=a>b?a:b;
 endfunction
 
 endmodule
