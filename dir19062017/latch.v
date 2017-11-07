//latch
module latch
(input d,en,
 output y);

assign y=en?d:1'bZ;
endmodule