#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Decode the two nibbles separately instead of XORing the whole byte.
	// XOR with 5 in each nibble reproduces the reference mask of 0x55.
	// That mask never changes the sign bit, so the original sign is usable.
	// A separate zero-segment branch avoids a negative shift count.
	int mantissa = (a_val & 15) ^ 5;
	int segment = ((a_val >> 4) ^ 5) & 7;
	int magnitude = mantissa * 16 + 8;

	if (segment != 0) {
		magnitude += 256;
		magnitude <<= segment - 1;
	}
	return (a_val & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
