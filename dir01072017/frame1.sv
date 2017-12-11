
module frame1;

struct packed
{
 reg [7:0]SOF;
 logic [15:0]payload;
 logic [31:0]CRC;
 bit [63:0]data;
 reg [7:0]EOF;
}m;

initial
begin
	m.SOF=8'h7E;
 	m.payload=16'hAA73;
 	m.CRC=32'hA795_BC43;
	m.data=3092;
	m.EOF=8'h7E;
	
	$display("%h",m.SOF);
	$display("%h",m.payload);
	$display("%h",m.CRC);
	$display("%d",m.data);
	$display("%h",m.EOF);
	$display("%b",m[74:32]);
	$display("%b",m[81:41]);
	$display("%b",m);
	$display("%h",m);
	$display("%d",m);
end
endmodule 	
