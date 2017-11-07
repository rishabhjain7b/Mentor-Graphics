vlog halfsubtractor.v
vsim halfsubtractor
add wave *
force a 1'b0
force b 1'b0
run

force a 1'b0
force b 1'b1
run

force a 1'b1
force b 1'b0
run

force a 1'b1
force b 1'b1
run
