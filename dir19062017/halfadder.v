//half adder, s=sum, c=carry

module halfadder
(input a,b,
 output s,c);

assign s=a^b,
       c=a&b;
endmodule

