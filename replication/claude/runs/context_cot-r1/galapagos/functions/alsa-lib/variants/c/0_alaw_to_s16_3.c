#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Replaces the shift with multiplication by a power of two, (1<<(seg-1)).
	// The values stay below 2^15, so the multiplication cannot overflow and equals the shift.
	// Segment 0 is handled separately as t*16+8, the same as (t<<4)+8.
	// The sign is applied by multiplying by +1 or -1, derived from bit 7.
	int v = (a_val ^ 0x55) & 0xff;
	int t = v & 0x7f;
	int seg = t >> 4;
	int sgn = ((v >> 7) & 1) * 2 - 1;
	if (seg == 0)
		t = t * 16 + 8;
	else
		t = ((t & 0x0f) * 16 + 264) * (1 << (seg - 1));
	return t * sgn;
}


int main(){
    alaw_to_s16('a');
}
