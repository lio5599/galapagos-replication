#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int bit;

	for (bit = 4; bit <= 30; bit++)
		parity ^= (data >> bit) & 1;
	return parity;
}


int main(){
    iec958_parity(0);
}
