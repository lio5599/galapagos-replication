#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Enumerate the eight segment scaling factors explicitly.
	// Segment zero subtracts 256 from the common biased mantissa.
	// Segments one through seven multiply by the reference powers of two.
	int x = a_val ^ 0x55;
	int t = (x & 15) * 16 + 264;

	switch ((x >> 4) & 7) {
	case 0: t -= 256; break;
	case 1: break;
	case 2: t *= 2; break;
	case 3: t *= 4; break;
	case 4: t *= 8; break;
	case 5: t *= 16; break;
	case 6: t *= 32; break;
	case 7: t *= 64; break;
	}

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
