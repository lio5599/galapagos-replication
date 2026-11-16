#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int val;
	unsigned int sum;
	int bit;

	val = data >> 4;
	sum = 0;
	for (bit = 0; bit < 27; bit++) {
		sum += (val & 1);
		val >>= 1;
	}
	return (sum & 1);
}


int main(){
    iec958_parity(0);
}
