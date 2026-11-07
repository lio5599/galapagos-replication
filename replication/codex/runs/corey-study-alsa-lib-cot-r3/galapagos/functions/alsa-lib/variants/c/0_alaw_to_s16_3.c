#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Enumerate the eight segment formulas rather than computing an exponent.
	// Each nonzero segment doubles both the mantissa step and the bias.
	// The masked segment always selects a case, including zero and seven.
	// The sign is applied only after computing the nonnegative magnitude.
	int decoded = a_val ^ 0x55;
	int mantissa = decoded & 15;
	int magnitude;

	switch ((decoded >> 4) & 7) {
	case 0: magnitude = mantissa * 16 + 8; break;
	case 1: magnitude = mantissa * 16 + 264; break;
	case 2: magnitude = mantissa * 32 + 528; break;
	case 3: magnitude = mantissa * 64 + 1056; break;
	case 4: magnitude = mantissa * 128 + 2112; break;
	case 5: magnitude = mantissa * 256 + 4224; break;
	case 6: magnitude = mantissa * 512 + 8448; break;
	default: magnitude = mantissa * 1024 + 16896; break;
	}

	return (decoded & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
