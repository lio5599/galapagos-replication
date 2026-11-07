#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Form the small-segment midpoint directly from the low nibble.
	// Nonzero segments add 256 before scaling, giving the reference bias 264.
	// Apply the sign by multiplying by exactly positive or negative one.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int t = ((x & 15) << 4) | 8;
	int sign = 2 * ((x >> 7) & 1) - 1;

	if (seg)
		t = (t + 256) << (seg - 1);

	return t * sign;
}


int main(){
    alaw_to_s16('a');
}
