`timescale 1ns / 1ps

module tb_ha( );

reg a,b;
wire sum,co;

integer i;
ha dut(a,b,sum,co);

initial begin
$monitor($time, "ns a=%b , b=%b , sum=%b , co=%b",a,b,sum,co);
for(i=0; i<4; i=i+1) begin
{a,b}=i;
#5;
end


end
endmodule
