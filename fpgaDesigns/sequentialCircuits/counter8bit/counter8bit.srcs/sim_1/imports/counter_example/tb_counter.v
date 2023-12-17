module tb_counter;

wire [7:0] count;
reg enable;
reg clock;
reg reset;

counter dut(
    count,
    enable,
    clock,
    reset
);

initial begin
clock=0;
forever #5 clock=~clock;
end

initial begin

reset=0;

#3;
enable=1; reset=1;
@(posedge clock);

#150;
reset=0;
#3;
enable=1; reset=1;
@(posedge clock);

#300;
$stop;
end
endmodule
