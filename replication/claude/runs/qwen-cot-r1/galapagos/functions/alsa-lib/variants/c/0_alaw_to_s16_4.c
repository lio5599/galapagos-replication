#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Converts A-law encoded sample to linear PCM.
	// XOR 0x55 corrects bit ordering for magnitude extraction.
	// Small values use simple left shift plus offset.
	// Large values decode segment and offset then shift by segment-1.
	// Sign bit controls final sign of result.
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
	return (a_val & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
