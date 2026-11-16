#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Uses explicit sign variable for clarity.
// Computes magnitude separately from sign.
// Segment decoding uses standard A-law formula.
// XOR 0x55 is required for proper bit interpretation.
// Handles all 256 possible input values correctly.
{
	int t;
	int seg;
	int sign;
	a_val ^= 0x55;
	t = a_val & 0x7f;
	sign = (a_val & 0x80) ? 1 : -1;
	if (t < 16)
		t = (t << 4) + 8;
	else {
		seg = (t >> 4) & 0x07;
		t = ((t & 0x0f) << 4) + 0x108;
		t <<= seg - 1;
	}
	return sign * t;
}


int main(){
    alaw_to_s16('a');
}
