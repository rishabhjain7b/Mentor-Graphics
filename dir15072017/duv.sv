module duv(input clk);
bit siga,sigb;
always @(posedge clk)
sigb<=!siga;
endmodule
