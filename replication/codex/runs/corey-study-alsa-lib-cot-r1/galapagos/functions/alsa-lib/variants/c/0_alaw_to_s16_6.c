#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Decompose the required exponent into shifts by one, two, and four.
	// Their combined effect equals the reference's shift by segment minus one.
	// Segment zero uses its own bias and exponent zero; no negative shifts occur.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int exponent = seg ? seg - 1 : 0;
	int t = (x & 15) * 16 + (seg ? 264 : 8);

	if (exponent & 1)
		t <<= 1;
	if (exponent & 2)
		t <<= 2;
	if (exponent & 4)
		t <<= 4;

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
