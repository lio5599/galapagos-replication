#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Tables hold the expanded bias and mantissa step for each segment.
	// These are exactly the reference bias and step after its left shift.
	// Masking guarantees valid indices; segment zero has its special bias.
	// The largest table-derived magnitude is 32256, so negation is safe.
	static const int bias[8] = {
		8, 264, 528, 1056, 2112, 4224, 8448, 16896
	};
	static const int step[8] = {
		16, 16, 32, 64, 128, 256, 512, 1024
	};
	int decoded = a_val ^ 0x55;
	int segment = (decoded >> 4) & 7;
	int magnitude = bias[segment] + (decoded & 15) * step[segment];

	return (decoded & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
