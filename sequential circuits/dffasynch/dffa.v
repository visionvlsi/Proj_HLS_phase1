// File: dffa.v
// Generated by MyHDL 0.11
// Date: Wed Dec 13 13:06:17 2023


`timescale 1ns/10ps

module dffa (
    q,
    d,
    clk,
    rst
);


output q;
reg q;
input d;
input clk;
input rst;




always @(posedge clk, negedge rst) begin: DFFA_LOGIC
    if (rst == 0) begin
        q <= 0;
    end
    else begin
        if ((rst == 0)) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end
end

endmodule
