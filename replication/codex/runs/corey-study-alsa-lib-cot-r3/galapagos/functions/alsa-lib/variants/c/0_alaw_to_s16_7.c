#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Assemble the unscaled magnitude with disjoint bit fields using OR.
	// Mantissa bits occupy positions four through seven, separate from bias.
	// Bias is 0x008 for segment zero and 0x108 for every other segment.
	// The conditional shift is zero for segment zero and never negative.
	int decoded = a_val ^ 0x55;
	int segment = (decoded >> 4) & 7;
	int magnitude = ((decoded & 15) << 4)
		| (segment == 0 ? 0x008 : 0x108);

	magnitude <<= segment == 0 ? 0 : segment - 1;
	return (decoded & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
