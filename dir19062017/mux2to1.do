vlog mux2to1.v
vsim mux2to1
add wave *
force a 1'b0
force b 1'b0
force s 1'b0
run

force a 1'b0
force b 1'b0
force s 1'b1
run

force a 1'b0
force b 1'b1
force s 1'b0
run

force a 1'b0
force b 1'b1
force s 1'b1
run

force a 1'b1
force b 1'b0
force s 1'b0
run

force a 1'b1
force b 1'b0
force s 1'b1
run

force a 1'b1
force b 1'b1
force s 1'b0
run

force a 1'b1
force b 1'b1
force s 1'b1
run
