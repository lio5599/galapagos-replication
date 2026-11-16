#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int tmp = data >> 4;
	unsigned int parity = 0;
	int i;

	tmp &= 0x3FFFFFFF;
	for (i = 0; i < 27; i++) {
		parity += (tmp >> i) & 1;
	}
	return parity & 1;
}


int main(){
    iec958_parity(0);
}
