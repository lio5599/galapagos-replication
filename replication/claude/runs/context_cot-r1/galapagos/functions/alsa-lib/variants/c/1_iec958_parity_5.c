#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Visit bits 30 down to 4 and XOR each one into p.
	// This covers the same 27 bit positions as the reference loop.
	// The visiting order does not matter, because XOR is commutative.
	unsigned int p = 0;
	int bit;
	for (bit = 30; bit >= 4; bit--)
		p ^= (data >> bit) & 1u;
	return p;
}


int main(){
    iec958_parity(0);
}
