#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned long value = (data >> 4) & 0x07fffffful;

	value ^= value >> 16;
	value ^= value >> 8;
	value ^= value >> 4;
	return (unsigned int)((0x6996ul >> (value & 15ul)) & 1ul);
}


int main(){
    iec958_parity(0);
}
