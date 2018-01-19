class coverage;
virtual intf i;
covergroup cg @(i.a,i.b,i.sel);
A: coverpoint i.a{bins a_bin = {[7:15]};}
B: coverpoint i.b;
S: coverpoint i.sel;
R: coverpoint i.s{bins s1 = {0,1};bins s2 = {2,3};}
D: coverpoint i.co;
endgroup
function new (virtual intf i);
this.i = i ;
cg = new;
endfunction
task sample1();
cg.sample();
endtask
endclass

