module ar_loc;

int d[]='{9,1,8,3,4,4}, tq[$];
initial
begin
//find all elements greater than 3
tq=d.find with (item>3);
$display("%p",tq);

tq=d.find_index with (item>3);
$display("%p",tq);

tq=d.find_first with (item>99);
$display("%p",tq);

tq=d.find_first_index with (item==8);
$display("%p",tq);

tq=d.find_last with (item==4);
$display("%p",tq);

tq=d.find_last_index with (item==4);
$display("%p",tq);
end
endmodule
