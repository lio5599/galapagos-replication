#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Fold the 27-bit value (bits 4-30) using XOR folding to compute parity.
	// Shift right by 4, mask to 27 bits, then repeatedly XOR halves.
	unsigned int temp = (data >> 4) & 0x1FFFFFF;
	temp ^= temp >> 16;
	temp ^= temp >> 8;
	temp ^= temp >> 4;
	temp ^= temp >> 2;
	temp ^= temp >> 1;
	return temp & 1;
}


int main(){
    iec958_parity(0);
}
