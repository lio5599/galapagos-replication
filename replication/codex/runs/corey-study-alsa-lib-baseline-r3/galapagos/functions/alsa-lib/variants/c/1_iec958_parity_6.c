#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int mask;
	unsigned int parity = 0;

	for (mask = 0x40000000u; mask >= 0x10u; mask >>= 1)
		parity ^= (data & mask) != 0u;

	return parity;
}


int main(){
    iec958_parity(0);
}
