// top module

`include "alu_package.sv"

module alu_top;
intf i();
alu aa(.a(i.a),.b(i.b),.co(i.co),.s(i.s),.sel(i.sel));
alu_test t(i);
endmodule

