module tb_aluSeq;

wire [15:0] q;
wire o;
wire z;
wire n;
reg [15:0] a;
reg [15:0] b;
reg [3:0] f;
reg clk;
reg rst;

integer i;
aluSeq dut(
    q,
    o,
    z,
    n,
    a,
    b,
    f,
    clk,
    rst
);


initial begin
clk=0;
forever #5 clk=~clk;
end


initial begin

rst=0;
@(posedge clk);
#3;
rst=1;
for(i=0; i<16; i=i+1) begin
if(i==4 || i==7 || i==8) begin
a=40000;
b=65000;
end
else
begin
a=88;
b=44;
end
f=i;
@(posedge clk);
#3;
$display($time, " ns Inputs a=%b(%0d) , b=%b(%0d)-- Opcode f=%b(%0d)-- Output q=%b(%0d)-- Flag-bits: Overflow o=%b, Zero z=%b, Negative n=%b",a,a,b,b,f,f,q,q,o,z,n);

#5;
end
end
endmodule
