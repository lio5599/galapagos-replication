#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Uses conditional operator for sign application.
// Computes magnitude first, then applies sign.
// Segment calculation uses bit manipulation for efficiency.
// XOR 0x55 is required for A-law decoding.
// Handles all edge cases including zero and maximum values.
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
