#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Approach: switch on the segment, with each case's shift and offset written out.
	// The offsets are 0x108<<(seg-1), and the mantissa shift is 4 for seg 0 and seg+3 otherwise.
	// Segment 0 uses m*16+8, which is the reference's t<16 branch.
	// The sign comes from bit 7, which XOR 0x55 does not change.
	int x = (a_val ^ 0x55) & 0x7f;
	int m = x & 0x0f;
	int t;
	switch (x >> 4) {
	case 0: t = (m << 4) + 8; break;
	case 1: t = (m << 4) + 0x108; break;
	case 2: t = (m << 5) + 0x210; break;
	case 3: t = (m << 6) + 0x420; break;
	case 4: t = (m << 7) + 0x840; break;
	case 5: t = (m << 8) + 0x1080; break;
	case 6: t = (m << 9) + 0x2100; break;
	default: t = (m << 10) + 0x4200; break;
	}
	return (a_val & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
