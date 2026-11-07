#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Factor the magnitude into an odd coefficient and a power of two.
	// Segment zero is eight times twice the mantissa plus one.
	// Other segments use twice the mantissa plus 33, scaled by seg plus two.
	// These are exact algebraic factorizations, including segment boundaries.
	int u = a_val ^ 0x55;
	int seg = (u >> 4) & 7;
	int mant = u & 15;
	int t;

	if (seg == 0)
		t = (2 * mant + 1) * 8;
	else
		t = (2 * mant + 33) * (1 << (seg + 2));
	return (u & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
