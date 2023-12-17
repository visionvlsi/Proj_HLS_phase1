module tb_dff;

wire q;
reg d;
reg clk;

dff dut(
    q,
    d,
    clk
);

initial begin
clk=0;
forever #5 clk=~clk;  
end

initial begin
d=0;
@(posedge clk);
#1;

d=1;
@(posedge clk);
#1;


d=0;
@(posedge clk);
#1;


d=1;
@(posedge clk);
#1;

d=0;
@(posedge clk);
#1;

$stop;
end



endmodule
