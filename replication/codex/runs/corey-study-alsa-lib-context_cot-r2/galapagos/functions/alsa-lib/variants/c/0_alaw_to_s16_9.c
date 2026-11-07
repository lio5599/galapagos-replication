#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Decompose the nonzero segment's scale into factors 2, 4, and 16.
	// These factors implement the three bits of the exponent seg minus one.
	// Segment zero bypasses scaling, and intermediate magnitudes never
	// exceed the final magnitude, whose maximum is 32256.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int t = (x & 15) * 16 + 8;

	if (seg != 0) {
		int exponent = seg - 1;
		t += 256;
		if (exponent & 1)
			t *= 2;
		if (exponent & 2)
			t *= 4;
		if (exponent & 4)
			t *= 16;
	}

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
