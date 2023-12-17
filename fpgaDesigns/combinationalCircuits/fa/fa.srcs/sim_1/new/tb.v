`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2023 07:47:03 AM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
reg a,b,c;
wire sum,co;

integer i;

 fa dut(a,b,c,sum,co);
initial begin
$monitor($time, "ns a=%b , b=%b, c=%b, sum=%b, co=%b",a,b,c,sum,co);

for(i=0; i<8; i=i+1) begin
{a,b,c}=i;
#5;
end

end
endmodule
