module ques2;

int i=0;
initial
begin
	for(i=0;i<=25;i++)
	begin
		i=i*2;
		if(i>=25) break;
		else continue;
	end
end

final
$write("%d ",i);

endmodule
		
