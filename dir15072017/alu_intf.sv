
interface intf;
bit [3:0]a,b;
bit [2:0]sel;
bit [3:0]s;
bit co;
modport drv(output a,b);
modport mon(input s,co);
endinterface

