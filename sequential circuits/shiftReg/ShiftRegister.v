// File: ShiftRegister.v
// Generated by MyHDL 0.11.42
// Date: Fri Dec 15 07:50:34 2023


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



always @(shift_enable, reg1, data_in) begin: SHIFTREGISTER_LOGIC
    if (shift_enable) begin
        data_out = reg1[0];
    end
    else begin
        data_out = data_in;
    end
end


always @(posedge clk, negedge rst) begin: SHIFTREGISTER_SHIFT_LOGIC
    if (rst == 0) begin
        reg1 <= 0;
    end
    else begin
        if (shift_enable) begin
            reg1[1-1:0] <= reg1[0-1:3];
            reg1[0] <= data_in;
        end
    end
end

endmodule