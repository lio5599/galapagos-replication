#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	int bit;

	data >>= 4;
	for (bit = 0; bit < 27; ++bit) {
		parity = (parity + data % 2u) % 2u;
		data /= 2u;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
