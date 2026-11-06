#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Splits the sign first, then decodes the 7-bit magnitude code.
	// Bit 7 of (a_val ^ 0x55) is bit 7 of a_val, because 0x55 has bit 7 clear.
	// t < 16 means segment 0: (t<<4)+8. Otherwise ((t&15)<<4 + 0x108) << (seg-1).
	// The shift is written as a left shift by seg, then a right shift by 1. No bits are lost.
	int positive = (a_val & 0x80) != 0;
	int t = (a_val ^ 0x55) & 0x7f;
	int r;
	if (t < 16)
		r = (t << 4) + 8;
	else
		r = ((((t & 0x0f) << 4) + 0x108) << (t >> 4)) >> 1;
	return positive ? r : -r;
}


int main(){
    alaw_to_s16('a');
}
