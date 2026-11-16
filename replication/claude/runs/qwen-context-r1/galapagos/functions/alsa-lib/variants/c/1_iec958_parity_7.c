#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int d;
	unsigned int p;
	int bit;

	d = data >> 4;
	p = 0;
	for (bit = 0; bit < 27; bit++) {
		p += d & 1;
		d >>= 1;
	}
	return (p & 1);
}


int main(){
    iec958_parity(0);
}
