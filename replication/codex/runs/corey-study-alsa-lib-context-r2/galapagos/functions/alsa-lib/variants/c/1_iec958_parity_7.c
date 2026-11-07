#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int bit;

	for (bit = 30; bit >= 4; bit--)
		parity = (parity + ((data >> bit) & 1U)) & 1U;

	return parity;
}


int main(){
    iec958_parity(0);
}
