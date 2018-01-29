module test1;
class parcel;
	static int count=2;
	function new();
	count++;
	$display("%d parcel",this.count);	
endfunction
endclass

initial
begin
	parcel pk3=new;
	
	
	parcel pk2=new;
	//$display("%d parcel",pk2.count);
	
	parcel pk1=new;
	//h$display("%d parcel",pk1.count);
end
endmodule
