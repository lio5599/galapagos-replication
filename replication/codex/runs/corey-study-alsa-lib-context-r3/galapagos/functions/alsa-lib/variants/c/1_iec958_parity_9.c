#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int pair;

	data >>= 4;
	for (pair = 0; pair < 13; ++pair) {
		parity ^= (data ^ (data >> 1)) & 1U;
		data >>= 2;
	}
	return parity ^ (data & 1U);
}


int main(){
    iec958_parity(0);
}
