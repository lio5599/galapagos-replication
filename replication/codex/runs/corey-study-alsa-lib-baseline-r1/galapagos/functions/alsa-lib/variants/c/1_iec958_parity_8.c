#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	unsigned int pair;
	int group;

	data = (data >> 4) & 0x07ffffffU;
	for (group = 0; group < 14; ++group) {
		pair = data & 3U;
		parity ^= (pair == 1U || pair == 2U);
		data >>= 2;
	}

	return parity;
}


int main(){
    iec958_parity(0);
}
