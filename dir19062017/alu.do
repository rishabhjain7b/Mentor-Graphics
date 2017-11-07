vlog alu.v
vsim alu
add wave *
force a 4'd7
force b 4'd5
force sel 3'd0
run

force a 4'd7
force b 4'd5
force sel 3'd1
run

force a 4'd7
force b 4'd5
force sel 3'd2
run

force a 4'd7
force b 4'd5
force sel 3'd3
run

force a 4'd7
force b 4'd5
force sel 3'd4
run

force a 4'd7
force b 4'd5
force sel 3'd5
run

force a 4'd7
force b 4'd5
force sel 3'd6
run

force a 4'd7
force b 4'd5
force sel 3'd7
run

