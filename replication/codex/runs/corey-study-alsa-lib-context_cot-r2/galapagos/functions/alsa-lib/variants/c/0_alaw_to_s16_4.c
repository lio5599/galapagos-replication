#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Classify the decoded seven-bit magnitude by segment boundaries.
	// Each interval applies exactly the reference's corresponding scale.
	// The first interval preserves the special segment-zero offset.
	int x = a_val ^ 0x55;
	int code = x & 127;
	int base = (code & 15) * 16 + 264;
	int t;

	if (code < 16)
		t = code * 16 + 8;
	else if (code < 32)
		t = base;
	else if (code < 48)
		t = base * 2;
	else if (code < 64)
		t = base * 4;
	else if (code < 80)
		t = base * 8;
	else if (code < 96)
		t = base * 16;
	else if (code < 112)
		t = base * 32;
	else
		t = base * 64;

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
