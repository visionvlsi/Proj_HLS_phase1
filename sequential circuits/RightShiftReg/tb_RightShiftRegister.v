module tb_RightShiftRegister;

reg clk;
reg rst;
reg data_in;
reg shift_enable;
wire data_out;

initial begin
    $from_myhdl(
        clk,
        rst,
        data_in,
        shift_enable
    );
    $to_myhdl(
        data_out
    );
end

RightShiftRegister dut(
    clk,
    rst,
    data_in,
    shift_enable,
    data_out
);

endmodule
