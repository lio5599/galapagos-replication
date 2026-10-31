#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	unsigned int v = (data >> 4) & 0x07FFFFFFu;
	unsigned int parity = 0;

	while (v) {
		parity ^= v & 0xFu;
		v >>= 4;
	}
	return (0x6996u >> parity) & 1u;
}


int main(){
    iec958_parity(0);
}
