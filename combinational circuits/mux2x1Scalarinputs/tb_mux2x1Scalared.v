module tb_mux2x1Scalared;

wire y;
reg a;
reg b;
reg sel;

initial begin
    $from_myhdl(
        a,
        b,
        sel
    );
    $to_myhdl(
        y
    );
end

mux2x1Scalared dut(
    y,
    a,
    b,
    sel
);

endmodule
