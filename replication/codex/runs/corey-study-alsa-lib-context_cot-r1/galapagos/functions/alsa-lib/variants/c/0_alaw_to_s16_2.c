#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Use the nonzero-segment bias for every segment initially.
	// Segment zero shifts by zero and then removes the extra 256.
	// All shifts have nonnegative counts and preserve the exact magnitude.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int shift = (seg == 0) ? 0 : seg - 1;
	int t = (((x & 15) << 4) + 264) << shift;

	t -= (seg == 0) ? 256 : 0;
	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
