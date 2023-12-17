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

initial begin
    $from_myhdl(
        a,
        b,
        f,
        clk,
        rst
    );
    $to_myhdl(
        q,
        o,
        z,
        n
    );
end

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

endmodule
