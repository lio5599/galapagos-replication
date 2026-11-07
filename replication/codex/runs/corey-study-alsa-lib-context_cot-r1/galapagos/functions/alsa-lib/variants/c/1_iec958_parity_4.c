#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Isolate original bits 4 through 30 and fold them with XOR.
	// Successive folds collect every retained bit into the low bit.
	// Masked-out bits cannot contribute, and zero remains zero.
	data = (data >> 4) & 0x07ffffffu;
	data ^= data >> 16;
	data ^= data >> 8;
	data ^= data >> 4;
	data ^= data >> 2;
	data ^= data >> 1;
	return data & 1u;
}


int main(){
    iec958_parity(0);
}
