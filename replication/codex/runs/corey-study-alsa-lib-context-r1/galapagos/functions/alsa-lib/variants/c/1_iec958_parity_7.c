#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int group;

	data = (data >> 4) & 0x07fffffful;
	for (group = 0; group < 7; ++group) {
		parity ^= (0x6996u >> (data & 15u)) & 1u;
		data >>= 4;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
