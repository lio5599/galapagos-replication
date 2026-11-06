#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Add each bit at positions 4..30 into a counter without changing data.
	// The counter's low bit is the parity, the same value the reference returns.
	// The largest possible count is 27, so the counter cannot overflow.
	unsigned int p = 0;
	int bit;
	for (bit = 4; bit < 31; bit++)
		p += (data >> bit) & 1u;
	return p & 1u;
}


int main(){
    iec958_parity(0);
}
