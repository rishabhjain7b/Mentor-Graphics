//N bit comparator, gt= a greater than b, lt= a less than b, eq= a equal b

module comparator#(parameter n=10)
(input [n-1:0]a,b,
 output gt,lt,eq);

assign gt=a>b,
       lt=a<b;
       eq=a==b;
endmodule