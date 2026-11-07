#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// XOR successive right-shifted copies of the selected field.
	// The accumulator's low bit receives each selected bit once.
	// Stopping at zero only omits zero bits; zero input returns zero.
	unsigned int accumulator = 0;

	data = (data >> 4) & 0x07ffffffU;
	while (data != 0) {
		accumulator ^= data;
		data >>= 1;
	}
	return accumulator & 1U;
}


int main(){
    iec958_parity(0);
}
