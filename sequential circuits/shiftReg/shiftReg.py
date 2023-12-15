from myhdl import *

@block
def shift_reg(clock,reset,y,inpb):
	shift = Signal(intbv(0)[4:]) #len(y)

	
	#mask = shift.max - 1
	
	@always_seq(clock.posedge, reset=reset)
	def beh_shift():
	
		shift.next=ConcatSignal(shift , inpb)
		"""
		if reset == 0:
			shift.next=0
		else:
		"""
		#shift.next=(shift << 1) & mask
            
		
	@always_comb
	def beh_assign():
		y.next=shift[3]
		
	return beh_shift, beh_assign

def convert():
    clock = Signal(bool(0))
    inpb= Signal(bool(0))
    reset = ResetSignal(val=1, active=0, isasync=True)
    y= Signal(bool(0)) #Signal(intbv(0)[4:])
    convInst = shift_reg(clock,reset,y,inpb)
    convInst.convert(hdl='Verilog')

convert()