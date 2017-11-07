// full subtractor using only half subtractor

module fs_using_hs
(input a,b,cin,
 output d,bo);
 
 wire w1,w2,w3,w4;
 
halfsubtractor hs1(a,b,w1,w3),
	  	hs2(cin,w1,d,w2),
	  	hs3(w3,w2,w4,bo);
	  
endmodule
