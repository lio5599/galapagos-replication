#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// A Boolean nonzero-segment flag selects both bias and shift arithmetically.
	// For segment zero it gives bias 8 and shift zero; otherwise bias is 264.
	// Subtracting the flag yields exactly segment minus one for other segments.
	// The sign multiplier is exactly minus one or plus one, with safe products.
	int decoded = a_val ^ 0x55;
	int segment = (decoded >> 4) & 7;
	int nonzero = segment != 0;
	int magnitude = (decoded & 15) * 16 + 8 + 256 * nonzero;
	int sign = 2 * ((decoded & 0x80) != 0) - 1;

	magnitude <<= segment - nonzero;
	return sign * magnitude;
}


int main(){
    alaw_to_s16('a');
}
