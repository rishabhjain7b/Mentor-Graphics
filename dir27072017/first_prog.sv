import uvm_pkg::*;

`include "uvm_macros.svh"

module first_prog;
	class hello_world extends uvm_test;
	`uvm_component_utils (hello_world)
	
	function new(string name="myclass",uvm_component parent);
		super.new(name,parent);
		`uvm_info("TEST RUN PHASE", "hello world",UVM_LOW)
	endfunction
	
	virtual task run_phase(uvm_phase phase);
		`uvm_info("Hello_N", "hello world",UVM_NONE)
		`uvm_info("Hello_L", "hello world",UVM_LOW)
		`uvm_info("Hello_M", "hello world",UVM_MEDIUM)
		`uvm_info("Hello_H", "hello world",UVM_HIGH)
		`uvm_info("Hello_F", "hello world",UVM_FULL)
	endtask
	endclass

initial
begin
	run_test();
end
endmodule
