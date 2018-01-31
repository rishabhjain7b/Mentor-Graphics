class interativeConstr;
rand byte arr[20];
constraint iterative_constr {
	foreach(arr[i])
		arr[i] inside {2,4,6,8};
	}
endclass

module test;
interativeConstr ic;
initial
 begin
 	ic=new();
 	ic.randomize();
 	foreach(ic.arr[j])
 		$display("ic.arr[%0d]=%0d",j,ic.arr[j]);
 end
endmodule
