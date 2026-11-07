#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int folded = 0;
	int group;

	data = (data >> 4) & 0x07ffffffU;
	for (group = 0; group < 7; ++group) {
		folded ^= data & 15U;
		data >>= 4;
	}
	folded ^= folded >> 2;
	folded ^= folded >> 1;
	return folded & 1U;
}


int main(){
    iec958_parity(0);
}
