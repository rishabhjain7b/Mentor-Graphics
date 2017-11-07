//half subtractor, d=difference, bo=borrow

module halfsubtractor
(input a,b,
 output d,bo);

assign d=a^b,
       bo=~a&b;
endmodule
