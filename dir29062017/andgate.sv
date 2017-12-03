// system verilog code for and gate

module andgate
(input logic a,b,
 output logic y);
 
 always_comb
 	y=a&b;
 always_comb
 	y=a|b;

endmodule

