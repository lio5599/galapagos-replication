#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	unsigned int mask = 0x10U;
	int bit;

	for (bit = 4; bit <= 30; ++bit) {
		parity ^= (data & mask) != 0U;
		mask <<= 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
