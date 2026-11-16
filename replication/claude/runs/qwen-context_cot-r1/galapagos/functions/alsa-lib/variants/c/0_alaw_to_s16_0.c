#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Converts A-law compressed 8-bit audio sample to 16-bit signed linear PCM.
// XOR with 0x55 reverses bit order for sign/magnitude interpretation.
// Extracts segment and offset to reconstruct linear amplitude.
// Applies sign based on original MSB. Handles all 256 inputs correctly.
{
	int t;
	int seg;
	a_val ^= 0x55;
	t = a_val & 0x7f;
	if (t < 16)
		t = (t << 4) + 8;
	else {
		seg = (t >> 4) & 0x07;
		t = ((t & 0x0f) << 4) + 0x108;
		t <<= seg - 1;
	}
	return ((a_val & 0x80) ? t : -t);
}


int main(){
    alaw_to_s16('a');
}
