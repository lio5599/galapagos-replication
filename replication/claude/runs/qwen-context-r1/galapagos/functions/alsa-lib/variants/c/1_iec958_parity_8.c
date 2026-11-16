#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int shifted;
	unsigned int parity;
	int i;

	shifted = data >> 4;
	parity = 0;
	for (i = 0; i < 27; i++) {
		if (shifted & 1)
			parity ^= 1;
		shifted >>= 1;
	}
	return parity;
}


int main(){
    iec958_parity(0);
}
