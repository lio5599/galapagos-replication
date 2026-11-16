#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int tmp = data >> 4;
	unsigned int parity = 0;

	tmp &= 0x3FFFFFFF;
	tmp ^= tmp >> 16;
	tmp ^= tmp >> 8;
	tmp ^= tmp >> 4;
	tmp ^= tmp >> 2;
	tmp ^= tmp >> 1;
	parity = tmp & 1;
	return parity;
}


int main(){
    iec958_parity(0);
}
