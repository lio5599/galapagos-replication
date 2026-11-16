#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int temp;
	unsigned int odd;
	int i;

	temp = data >> 4;
	odd = 0;
	for (i = 0; i < 27; i++) {
		odd ^= (temp & 1);
		temp >>= 1;
	}
	return odd;
}


int main(){
    iec958_parity(0);
}
