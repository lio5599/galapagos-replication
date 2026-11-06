#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Reference: decodes one G.711 A-law byte into a signed linear PCM sample.
	// Approach: XOR 0x55, split into mantissa m and segment seg, form m*16+8.
	// If seg is nonzero, add the implicit 0x100 bit and shift left by seg-1.
	// This gives m*16+8 for seg 0 and ((m<<4)+0x108)<<(seg-1) otherwise, as in the reference.
	// XOR 0x55 leaves bit 7 alone, so testing bit 7 of the input gives the same sign.
	int x = (a_val ^ 0x55) & 0x7f;
	int m = x & 0x0f;
	int seg = x >> 4;
	int t = (m << 4) + 8;
	if (seg) {
		t += 0x100;
		t <<= seg - 1;
	}
	return (a_val & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
