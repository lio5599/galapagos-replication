#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Count the set bits at original positions 4 through 30.
	// Taking the low bit of the count gives the reference parity.
	// The count cannot exceed 27, and all other input bits are ignored.
	unsigned int count = 0;
	int remaining = 27;

	data >>= 4;
	while (remaining != 0) {
		count += data & 1u;
		data >>= 1;
		remaining--;
	}
	return count & 1u;
}


int main(){
    iec958_parity(0);
}
