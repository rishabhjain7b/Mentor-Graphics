vlog inverter.v
vsim inverter
add wave *
force a 1'b0
run

force a 1'b1
run
