from myhdl import *

@block
def dffa(q, d, clk, rst):

    @always_seq(clk.posedge, reset=rst)
    def logic():
        
        if rst == 0:    # nRst ?  or use active high ?
            q.next = 0
        else:
            q.next = d

    return logic

def convert():
    q, d, clk = [Signal(bool(0)) for i in range(3)]
    rst = ResetSignal(val=1, active=0, isasync=True)
    convInst = dffa(q, d, clk, rst)
    convInst.convert(hdl='Verilog')

convert()
