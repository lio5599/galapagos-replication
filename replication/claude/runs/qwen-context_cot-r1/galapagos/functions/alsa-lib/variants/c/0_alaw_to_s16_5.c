#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Implements decoding using lookup table for small values.
// For t < 16, uses precomputed table of 16 entries.
// For larger values, uses standard segment formula.
// XOR 0x55 prepares A-law code for decoding.
// Sign bit determines output sign.
{
	int t;
	int seg;
	int small_table[] = {8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128};
	a_val ^= 0x55;
	t = a_val & 0x7f;
	if (t < 16) {
		t = small_table[t];
	} else {
		seg = (t >> 4) & 0x07;
		t = ((t & 0x0f) << 4) + 0x108;
		t <<= seg - 1;
	}
	return ((a_val & 0x80) ? t : -t);
}


int main(){
    alaw_to_s16('a');
}
