#include <stdint.h>

__attribute__((noinline))
static unsigned int iec958_parity(unsigned int data)
{
	// Accumulate alternating retained positions in separate XOR sums.
	// Thirteen pairs and one last bit cover original bits 4 through 30.
	// Combining the sums gives parity and ignores every excluded bit.
	unsigned int even = 0;
	unsigned int odd = 0;
	int pair;

	data >>= 4;
	for (pair = 0; pair < 13; pair++) {
		even ^= data & 1u;
		data >>= 1;
		odd ^= data & 1u;
		data >>= 1;
	}
	even ^= data & 1u;
	return even ^ odd;
}


int main(){
    iec958_parity(0);
}
