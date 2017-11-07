// 4bit parity checker and generator

module parity4bit
(input [3:0]a,
 input g,
 output ep,od);
 
 assign ep=g?(^a==1):~(^a==1),
 	op=g?~(^a==0):(^a==0);
 	
 endmodule
