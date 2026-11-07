#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int count = 0;

	data = (data >> 4) & 0x07FFFFFFU;
	while (data) {
		count += data % 2U;
		data /= 2U;
	}

	return count % 2U;
}


int main(){
    iec958_parity(0);
}
