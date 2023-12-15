// File: ShiftRegister.v
// Generated by MyHDL 0.11
// Date: Fri Dec 15 11:18:38 2023


`timescale 1ns/10ps

module ShiftRegister (
    clk,
    rst,
    data_in,
    shift_enable,
    data_out
);
// 4-bit shift register with 1-bit left shift.

input clk;
input rst;
input data_in;
input shift_enable;
output data_out;
reg data_out;

reg [3:0] reg1;



always @(shift_enable, reg1) begin: SHIFTREGISTER_LOGIC
    if (shift_enable) begin
        data_out = reg1[3];
    end
end


always @(posedge clk) begin: SHIFTREGISTER_SHIFT_LOGIC
    if (rst == 0) begin
        reg1 <= 0;
    end
    else begin
        if (shift_enable) begin
            reg1[4-1:1] <= reg1[3-1:0];
            reg1[0] <= data_in;
        end
    end
end

endmodule
