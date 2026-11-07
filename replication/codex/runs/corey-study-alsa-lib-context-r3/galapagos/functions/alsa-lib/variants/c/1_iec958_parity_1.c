#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int parity = 0;
	unsigned int remaining = 27;

	data >>= 4;
	do {
		parity += data & 1U;
		data >>= 1;
	} while (--remaining);

	return parity & 1U;
}


int main(){
    iec958_parity(0);
}
