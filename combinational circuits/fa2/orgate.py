from myhdl import *

@block
def orgate(a,b,y):

    """
    OR Gate
    y - outputs
    a,b - inputs

    """

    @always_comb
    def comb():
        if a==0 and b==0:
            y.next=0
        else:
            y.next=1

    return comb