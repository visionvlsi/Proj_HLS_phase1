`timescale 1ns/1ns
module tb_RAM;

wire [7:0] dout;
reg [7:0] din;
reg [6:0] addr;
reg we;
reg clk;

reg [7:0] tmp [0:127];
integer i;
RAM dut(
    dout,
    din,
    addr,
    we,
    clk
);

initial begin
clk=0;
forever #5 clk=~clk;   
end

initial begin

for( i=0; i<128; i=i+1) begin
we=1; addr=i; din=$random; tmp[i]=din;
@(posedge clk);
#3;
end
   
for( i=0; i<128; i=1+1) begin
we=0; addr=$random;
@(posedge clk);
#3;
if(dout==tmp[addr])
$display(" Written value @Address %0d is read out correctly. Which is %0d",addr, dout);
end
#25;
end

initial begin
#3500;
$finish;
end
endmodule
