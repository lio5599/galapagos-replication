#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Mask the selected field and fold its bits together with XOR.
	// Each fold combines disjoint groups until bit zero holds parity.
	// Zero stays zero; bits outside the field cannot affect the result.
	// Two successive eight-bit shifts avoid a width-sized shift.
	data = (data >> 4) & 0x07ffffffU;
	data ^= (data >> 8) >> 8;
	data ^= data >> 8;
	data ^= data >> 4;
	data ^= data >> 2;
	data ^= data >> 1;
	return data & 1U;
}


int main(){
    iec958_parity(0);
}
