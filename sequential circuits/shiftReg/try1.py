from myhdl import *

@block
def ShiftRegister(clk, rst, data_in, shift_enable, data_out):
    """4-bit shift register with 1-bit left shift."""

    reg1 = Signal(intbv(0)[4:])  # 4-bit register

    @always_comb
    def logic():
        if shift_enable:
            data_out.next = reg1[0]
        else:
            data_out.next = data_in

    @always_seq(clk.posedge, reset=rst)
    def shift_logic():
        if shift_enable:
            reg1.next[1:] = reg1[0:3]  # Perform 1-bit left shift
            reg1.next[0] = data_in    # Load data_in into the LSB position

    return logic, shift_logic

def convert():
    clk ,data_in,data_out, shift_enable= [Signal(bool(0)) for i in range(4)]
    rst = ResetSignal(val=0, active=0, isasync=True)
    convInst = ShiftRegister(clk, rst, data_in, shift_enable, data_out)
    convInst.convert(hdl='Verilog')

convert()