module tb_dffa;

wire q;
reg d;
reg clk;
reg rst;

dffa dut(
    q,
    d,
    clk,
    rst
);


initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin

rst=0;
#3;
d=1; rst=1;
@(posedge clk);

#3;
d=0; rst=1;
@(posedge clk);

#3;
d=1; rst=1;
@(posedge clk);

rst=0;

#3;
d=1; rst=1;
@(posedge clk);

#20;
$stop;


end
endmodule
