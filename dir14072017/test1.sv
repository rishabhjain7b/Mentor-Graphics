// mixed constraint example

module test1;
typedef enum {short,legal,long}packet_type;

class class_rand_imp;
rand packet_type pt;
rand integer packet_length;
rand bit payload[];

constraint c1{payload.size==packet_length;}
constraint c2{pt==short -> packet_length<20;}
constraint c3{pt==legal -> packet_length inside {[20:100]};}
constraint c4{pt==long -> packet_length inside {[100:1000]};}

task display();
begin
	$write("packet_type=%s,\t packet_length=%0d,\t payload=%0p \n",pt,packet_length,payload);
end
endtask
endclass

class_rand_imp p=new();
initial
begin
	repeat(5)
	begin
	assert(p.randomize() with {pt==legal;})
	p.display();
	else
	$display("fail");
	end
end
endmodule
	
