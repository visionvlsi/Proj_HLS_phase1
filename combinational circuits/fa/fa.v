// File: fa.v
// Generated by MyHDL 0.11.42
// Date: Sun Dec 10 21:35:42 2023


`timescale 1ns/10ps

module fa (
    a,
    b,
    c,
    sum,
    co
);


input a;
input b;
input c;
output sum;
reg sum;
output co;
reg co;

reg s1;
reg c1;
reg c2;



always @(b, a) begin: FA_HA0_0_COMB
    if (((a == 0) && (b == 0))) begin
        s1 = 0;
        c1 = 0;
    end
    else if (((a == 0) && (b == 1))) begin
        s1 = 1;
        c1 = 0;
    end
    else if (((a == 1) && (b == 0))) begin
        s1 = 1;
        c1 = 0;
    end
    else begin
        s1 = 0;
        c1 = 1;
    end
end


always @(c, s1) begin: FA_HA1_COMB
    if (((s1 == 0) && (c == 0))) begin
        sum = 0;
        c2 = 0;
    end
    else if (((s1 == 0) && (c == 1))) begin
        sum = 1;
        c2 = 0;
    end
    else if (((s1 == 1) && (c == 0))) begin
        sum = 1;
        c2 = 0;
    end
    else begin
        sum = 0;
        c2 = 1;
    end
end


always @(c2, c1) begin: FA_ORGATE0_0_COMB
    if (((c1 == 0) && (c2 == 0))) begin
        co = 0;
    end
    else if (((c1 == 0) && (c2 == 1))) begin
        co = 1;
    end
    else if (((c1 == 1) && (c2 == 0))) begin
        co = 1;
    end
    else begin
        co = 1;
    end
end

endmodule
