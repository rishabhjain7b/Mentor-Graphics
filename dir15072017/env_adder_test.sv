// test module

module env_adder_test(intf i);
environment en;
initial
begin
en=new(i);
en.build();
repeat(20)
begin
en.run();
end
end
endmodule
// Change module to program ...endprogram

