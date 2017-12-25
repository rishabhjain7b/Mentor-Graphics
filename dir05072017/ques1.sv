//enum question

module ques1;

enum {monday,tuesday,wednesday,thursday,friday,saturday,sunday} day;
initial
//int i=0;
begin	
	day=day.first;
	forever
	begin
		$display("%d %s",day,day.name);
		day=day.next;
		if(day==day.last) 
		begin
		$display("%d %s",day,day.name);
		break;
		end
	end
end

endmodule
