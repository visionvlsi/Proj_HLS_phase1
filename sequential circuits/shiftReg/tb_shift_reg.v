module tb_shift_reg;

reg clock;
reg reset;
wire y;
reg inpb;

initial begin
    $from_myhdl(
        clock,
        reset,
        inpb
    );
    $to_myhdl(
        y
    );
end

shift_reg dut(
    clock,
    reset,
    y,
    inpb
);

endmodule
