#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Factor eight out of both magnitude formulas.
	// Segment zero becomes eight times an odd number from 1 through 31.
	// Other segments use twice the mantissa plus 33, shifted by segment plus two.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int mant = x & 15;
	int t;

	if (seg == 0)
		t = (2 * mant + 1) << 3;
	else
		t = (2 * mant + 33) << (seg + 2);

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
