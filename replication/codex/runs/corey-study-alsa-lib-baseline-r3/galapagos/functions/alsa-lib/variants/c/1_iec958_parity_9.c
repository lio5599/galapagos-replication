#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int count = 0;
	int remaining = 27;

	data /= 16u;
	do {
		count += data % 2u;
		data /= 2u;
	} while (--remaining);

	return count % 2u;
}


int main(){
    iec958_parity(0);
}
