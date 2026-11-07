#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int group;

	data >>= 4;
	for (group = 0; group < 9; ++group) {
		parity ^= data ^ (data >> 1) ^ (data >> 2);
		data >>= 3;
	}
	return parity & 1u;
}


int main(){
    iec958_parity(0);
}
