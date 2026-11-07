#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// The reference decodes an A-law byte into a signed 16-bit PCM sample.
	// Undo the alternating-bit mask, then decode the segment and mantissa.
	// Segment zero uses bias 8; higher segments use bias 264 and scaling.
	// The sign bit is unchanged by the mask, including at both extremes.
	int decoded = a_val ^ 0x55;
	int segment = (decoded >> 4) & 7;
	int mantissa = decoded & 15;
	int magnitude;

	if (segment == 0)
		magnitude = mantissa * 16 + 8;
	else
		magnitude = (mantissa * 16 + 264) << (segment - 1);

	return (decoded & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
