// full adder using only half adder

module fa_using_ha
(input a,b,cin,
 output s,c);
 
 wire w1,w2,w3,w4;
 
halfadder ha1(a,b,w1,w3),
	  ha2(cin,w1,s,w2),
	  ha3(w3,w2,w4,c);
	  
endmodule
