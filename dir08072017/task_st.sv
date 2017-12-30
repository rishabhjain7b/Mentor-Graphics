module task_st;
initial
begin 
	assign_value();
	assign_value();
end

task static assign_value();
static int a=1,b=2,c=3;
a=a+1;
b=b+2;
c=c+3;
$display("a=%d,b=%d,c=%d",a,b,c);
endtask
endmodule
