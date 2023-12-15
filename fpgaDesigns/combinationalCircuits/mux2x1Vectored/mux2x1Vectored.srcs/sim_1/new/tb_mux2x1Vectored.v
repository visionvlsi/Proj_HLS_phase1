`timescale 1ns / 1ps

module tb_mux2x1Scalared();

wire [7:0]y;
reg [7:0]a,b;
reg sel;

mux2x1Vectored dut(y,a,b,sel);

initial begin

$monitor($time, "ns a=%0d b=%0d sel=%b y=%0d", a,b,sel,y);

repeat(10) begin
a=$random;
b=$random;
sel=$random;
#5;
end
#5;
$stop;
end

endmodule
