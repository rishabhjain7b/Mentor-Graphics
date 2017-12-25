// typedef and struct

typedef struct
{ reg [7:0]a;
  bit [4:0]b;
  logic [3:0]c;
}m[0:1];

module struct_demo;
struct
{ reg [7:0]a;
  bit [4:0]b;
  logic [3:0]c;
}p='{100,20,10};

m s='{'{90,17,9},'{09,71,90}};

initial
begin
	$display("a=%d,b=%d,c=%d",p.a,p.b,p.c);
	$display("a=%d,b=%d,c=%d",s[0].a,s[0].b,s[0].c);
	$display("%p",s);
end
endmodule
