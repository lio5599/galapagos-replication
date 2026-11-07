#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Merge segments zero and one into one linear expression.
	// For decoded values 16 through 31, 16*n + 8 includes the 256 bias.
	// Larger segments retain the reference mantissa and scaling exactly.
	int x = a_val ^ 0x55;
	int n = x & 127;
	int t;

	if (n < 32)
		t = n * 16 + 8;
	else
		t = ((n & 15) * 16 + 264) << ((n >> 4) - 1);

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
