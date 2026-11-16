#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Implements using bitwise operations for sign handling.
// Uses arithmetic negation for sign application.
// Segment calculation follows standard A-law decoding.
// XOR 0x55 prepares the compressed code for decoding.
// Equivalent to reference for all valid inputs.
{
	int t;
	int seg;
	int mag;
	a_val ^= 0x55;
	t = a_val & 0x7f;
	if (t < 16)
		mag = (t << 4) + 8;
	else {
		seg = (t >> 4) & 0x07;
		mag = ((t & 0x0f) << 4) + 0x108;
		mag <<= seg - 1;
	}
	return (a_val & 0x80) ? mag : -mag;
}


int main(){
    alaw_to_s16('a');
}
