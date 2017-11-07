// o/p is 1 if exactly 2 of its 3 i/ps are 1

module oneifones
(input [2:0]a,
 output y);
 
 assign y=(^a==0)?(|a==1)?1:0:0;
 
 endmodule
 
