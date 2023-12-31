import myhdl
from myhdl import *

t_ALU_FUNCTION = enum(
    "ZERO",
    "ONES",
    "A",
    "NEG_A",
    "A_PLUS_1",
    "B",
    "NEG_B",
    "B_PLUS_1",
    "A_PLUS_B",
    "NOT_A",
    "NOT_B",
    "A_AND_B",
    "A_OR_B",
    "A_XOR_B",
    )
@block
def aluSeq(q, o, z, n, a, b, f, clk, rst, width=16):
    """
    Simple ALU.
    See ARM System Architecture "Introduction To Processor Design"
    """

    result = Signal(intbv(0)[width:])

    """@always(clk.posedge)"""
    @always_seq(clk.posedge, reset=rst)
    def alu_func():
        if rst==0:
            result.next = 0
        elif f == t_ALU_FUNCTION.ZERO:
            result.next = 0
        elif f == t_ALU_FUNCTION.ONES:
            result.next = 2 ** width - 1
        elif f == t_ALU_FUNCTION.NEG_A:
            result.next = -a % 2 ** width
        elif f == t_ALU_FUNCTION.NEG_B:
            result.next = -b % 2 ** width
        elif f == t_ALU_FUNCTION.NOT_A:
            result.next = ~a
        elif f == t_ALU_FUNCTION.NOT_B:
            result.next = ~b
        elif f == t_ALU_FUNCTION.A:
            result.next = a
        elif f == t_ALU_FUNCTION.B:
            result.next = b
        elif f == t_ALU_FUNCTION.A_PLUS_1:
            result.next = a + 1
        elif f == t_ALU_FUNCTION.B_PLUS_1:
            result.next = b + 1
        elif f == t_ALU_FUNCTION.A_AND_B:
            result.next = a & b
        elif f == t_ALU_FUNCTION.A_OR_B:
            result.next = a | b
        elif f == t_ALU_FUNCTION.A_XOR_B:
            result.next = a ^ b
        elif f == t_ALU_FUNCTION.A_PLUS_B:
            result.next = a + b
        else:
            result.next=0

    @always_comb
    def alu_status():
        q.next = result

        if result == 0:
            z.next = 1
        else:
            z.next = 0

        # Negative flag (n)
        n.next = result[width - 1]

        # Overflow flag (o)
        # For overflow detection, we check if the addition of two positive numbers
        # results in a negative number or if the addition of two negative numbers
        # results in a positive number.
        if (f == t_ALU_FUNCTION.A_PLUS_B) or (f == t_ALU_FUNCTION.A_PLUS_1) or (f == t_ALU_FUNCTION.B_PLUS_1):
        # Overflow occurs if the sign of a and b is the same, but the sign of the result is different.
            if (a[width - 1] == b[width - 1]) and (result[width - 1] != a[width - 1]):
                o.next = 1
            else:
                o.next = 0
        else:
            o.next = 0

    return instances()

def convert(hdl):
    clk,n,z,o= [Signal(bool(0)) for i in range(4)]
    q = Signal(intbv(0)[16:])
    a = Signal(intbv(0)[16:])
    b = Signal(intbv(0)[16:])
    f = Signal(t_ALU_FUNCTION.ZERO)
    rst = ResetSignal(0, active=0, isasync=True)
    convInst = aluSeq(q, o, z, n, a, b, f, clk, rst, width=16)
    convInst.convert(hdl=hdl)
convert(hdl='Verilog')
"""
clk = Signal(bool(0))
n = Signal(bool(0))
z = Signal(bool(0))
o = Signal(bool(0))
q = Signal(intbv(0)[16:])
a = Signal(intbv(0)[16:])
b = Signal(intbv(0)[16:])
f = Signal(t_ALU_FUNCTION.ZERO)

toVerilog(ALU,q=q, o=o, z=z, n=n, a=a, b=b, f=f, clk=clk)

"""