// File: ALU_combi.v
// Generated by MyHDL 0.11.42
// Date: Wed Dec 13 04:07:08 2023


`timescale 1ns/10ps

module ALU_combi (
    q,
    o,
    z,
    n,
    a,
    b,
    f
);
// Simple ALU.
// See ARM System Aerchitecture "Introduction To Processor Design"

output [15:0] q;
reg [15:0] q;
output o;
reg o;
output z;
reg z;
output n;
reg n;
input [15:0] a;
input [15:0] b;
input [3:0] f;

reg [15:0] result;



always @(a, b, f) begin: ALU_COMBI_ALU_FUNC
    case (f)
        4'b0000: begin
            result = 0;
        end
        4'b0001: begin
            result = ((2 ** 16) - 1);
        end
        4'b0011: begin
            result = ((-a) % (2 ** 16));
        end
        4'b0110: begin
            result = ((-b) % (2 ** 16));
        end
        4'b1001: begin
            result = (~a);
        end
        4'b1010: begin
            result = (~b);
        end
        4'b0010: begin
            result = a;
        end
        4'b0101: begin
            result = b;
        end
        4'b0100: begin
            result = (a + 1);
        end
        4'b0111: begin
            result = (b + 1);
        end
        4'b1011: begin
            result = (a & b);
        end
        4'b1100: begin
            result = (a | b);
        end
        4'b1101: begin
            result = (a ^ b);
        end
        4'b1000: begin
            result = (a + b);
        end
        default: begin
            result = 0;
        end
    endcase
end


always @(result) begin: ALU_COMBI_ALU_STATUS
    q = result;
    if ((result == 0)) begin
        z = 1;
    end
    else begin
        z = 0;
    end
    n = 0;
    o = 0;
end

endmodule
