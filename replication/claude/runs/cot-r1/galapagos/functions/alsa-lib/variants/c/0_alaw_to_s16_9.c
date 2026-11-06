#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Approach: use bit OR. (m<<4)+0x108 equals ((m | 0x10) << 4) | 8.
	// This holds because m<<4 occupies bits 4..7 only, so no carries occur.
	// For seg 0 the leading bit is omitted, giving (m<<4)|8 = m*16+8.
	// The shift is seg-1 for seg>=1 and 0 for seg 0, and the sign comes from bit 7.
	int x = (a_val ^ 0x55) & 0x7f;
	int seg = x >> 4;
	int lead = seg ? 0x10 : 0;
	int t = (((x & 0x0f) | lead) << 4) | 8;
	t <<= seg ? seg - 1 : 0;
	return (a_val & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
