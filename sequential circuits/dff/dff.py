from myhdl import *

@block
def dff(q, d, clk):

    @always(clk.posedge)
    def logic():
        q.next = d

    return logic


def convert():
    q, d, clk = [Signal(bool(0)) for i in range(3)]
    convInst = dff(q, d, clk) 
    convInst.convert(hdl='Verilog')

convert()