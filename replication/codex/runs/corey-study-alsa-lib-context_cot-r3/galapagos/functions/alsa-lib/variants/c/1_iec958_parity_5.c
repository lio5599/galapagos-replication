#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Compute population counts in pairs, nibbles, then bytes.
	// Add the byte counts and return the total count modulo two.
	// The mask excludes unrelated bits and zero yields zero.
	// Successive eight-bit shifts also work for narrower unsigned int.
	data = (data >> 4) & 0x07ffffffU;
	data -= (data >> 1) & 0x55555555U;
	data = (data & 0x33333333U) + ((data >> 2) & 0x33333333U);
	data = (data + (data >> 4)) & 0x0f0f0f0fU;
	data += data >> 8;
	data += (data >> 8) >> 8;
	return data & 1U;
}


int main(){
    iec958_parity(0);
}
