`timescale 1ns / 1ps


module tb();


// Simple ALU.
// See ARM System Aerchitecture "Introduction To Processor Design"

wire [15:0] q;
wire o;
wire z;
wire n;
reg [15:0] a;
reg [15:0] b;
reg [3:0] f;
integer i;
ALU_combi dut(q,o,z,n,a,b,f);

initial begin
for(i=0; i<16; i=i+1) begin
#1;
a=88;
b=44;
f=i;
$display($time, " ns Inputs a=%b(%0d) , b=%b(%0d)-- Opcode f=%b(%0d)-- Output q=%b(%0d)-- Flag-bits: Overflow o=%b, Zero z=%b, Negative n=%b",a,a,b,b,f,f,q,q,o,z,n);

#5;
end

end
endmodule
