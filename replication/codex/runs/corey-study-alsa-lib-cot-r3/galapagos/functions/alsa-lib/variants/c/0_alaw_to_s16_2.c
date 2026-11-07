#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Express the mantissa contribution as eight times an odd integer.
	// Nonzero segments add 256 and multiply by the reference power of two.
	// Segment zero instead adds nothing and uses a multiplier of one.
	// All magnitudes, from 8 through 32256, fit in a signed 16-bit int.
	int decoded = a_val ^ 0x55;
	int segment = (decoded >> 4) & 7;
	int magnitude = ((decoded & 15) * 2 + 1) * 8;
	int scale = 1 << (segment ? segment - 1 : 0);

	magnitude = (magnitude + (segment ? 256 : 0)) * scale;
	return (decoded & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
