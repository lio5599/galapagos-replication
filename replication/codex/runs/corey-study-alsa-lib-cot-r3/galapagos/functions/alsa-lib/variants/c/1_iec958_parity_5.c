#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Mask to the selected bits, then count set bits in parallel-sized groups.
	// The masks prevent carries between groups until their counts are combined.
	// The final count is at most 27; its low bit is parity, also for zero.
	unsigned long x = ((unsigned long)data >> 4) & 0x07FFFFFFUL;

	x = x - ((x >> 1) & 0x55555555UL);
	x = (x & 0x33333333UL) + ((x >> 2) & 0x33333333UL);
	x = (x + (x >> 4)) & 0x0F0F0F0FUL;
	x += x >> 8;
	x += x >> 16;
	return (unsigned int)(x & 1UL);
}


int main(){
    iec958_parity(0);
}
