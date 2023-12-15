`timescale 1ns / 1ps

module tb_mux2x1Scalared();

wire y;
reg a,b,sel;

mux2x1Scalared dut(y,a,b,sel);

initial begin

$monitor($time, "ns a=%b b=%b sel=%b y=%b", a,b,sel,y);

repeat(10) begin
{a,b,sel}=$random;
#5;
end
#5;
$stop;
end

endmodule
