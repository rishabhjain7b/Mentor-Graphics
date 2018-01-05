
class graphics_img;
rand bit img;
bit [9:0]pixel[9:0];
constraint c1{
	img dist{1:=20,0:=80};
	}
endclass

module ques6;
graphics_img g1=new();
initial
begin
	int i,j;
	int b=0,w=0;
	
	foreach(g1.pixel[i,j])
	begin
	if(g1.randomize())
	g1.pixel[i][j]=g1.img;
	end
	for(i=0;i<10;i++)
	begin
		for(j=0;j<10;j++)
		begin
		$write("%b",g1.pixel[i][j]);
		{b,w}=(g1.pixel[i][j])?{b,w+1}:{b+1,w};
		end
		$write("\n");
	end
	$write("black=%0d\twhite=%0d",b,w);
end
endmodule
	
