#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Use a lookup table approach conceptually by computing parity via
	// repeated XOR of shifted values to reduce 27 bits to 1 bit.
	unsigned int temp = (data >> 4) & 0x1FFFFFF;
	temp = temp ^ (temp >> 1);
	temp = temp ^ (temp >> 2);
	temp = temp ^ (temp >> 4);
	temp = temp ^ (temp >> 8);
	temp = temp ^ (temp >> 16);
	return temp & 1;
}


int main(){
    iec958_parity(0);
}
