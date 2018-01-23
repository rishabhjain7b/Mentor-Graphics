class B;
extern task print();
endclass

task B::print();
$display("SV");
endtask

module main2;
initial
begin
	B b=new;
	b.print();
	//B::print();
end
endmodule
