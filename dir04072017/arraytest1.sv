module arraytest1;

int arr[8]='{5,10,7,4,3,5,7,8};
int q[$];
initial
begin
	q=arr.unique();
	$display("%p",arr);
	$display("%p",q);
end 
endmodule
