#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Applies the sign without branching: (t ^ mask) - mask, with mask = 0 or -1.
	// With mask = -1, (~t)+1 equals -t in two's complement. With mask = 0, t is unchanged.
	// The mask is -1 when bit 7 is clear. Since 0x55 leaves bit 7 alone, the original bit 7 is used.
	// The magnitude is computed exactly as in the reference.
	int v = (a_val ^ 0x55) & 0xff;
	int t = v & 0x7f;
	int mask = ((v >> 7) & 1) - 1;
	if (t < 16) {
		t = (t << 4) + 8;
	} else {
		int seg = (t >> 4) & 0x07;
		t = (((t & 0x0f) << 4) + 0x108) << (seg - 1);
	}
	return (t ^ mask) - mask;
}


int main(){
    alaw_to_s16('a');
}
