vlog latch.v
vsim latch
add wave *
force d 1'en0
force en 1'en0
run

force d 1'en0
force en 1'en1
run

force d 1'en1
force en 1'en0
run

force d 1'en1
force en 1'en1
run