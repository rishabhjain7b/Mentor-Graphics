// test module

program alu_test(intf i);
environment en;
initial
begin
en=new(i);
//assert(en.build())
//begin
en.build();
repeat(100)
begin
en.run();
//end
end
end
endprogram
// Change module to program ...endprogram

