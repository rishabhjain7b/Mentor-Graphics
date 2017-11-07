//full subtractor, d=difference, bo=borrow

module fullsubtractor
(input a,b,bin,
 output d,bo);

assign d=a^b^bin,
       bo=~a&b|~a&bin|b&bin;
endmodule