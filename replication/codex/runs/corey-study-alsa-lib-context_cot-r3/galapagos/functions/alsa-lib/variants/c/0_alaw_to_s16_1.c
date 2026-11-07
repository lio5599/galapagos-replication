#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Select the segment-dependent bias and a nonnegative shift count.
	// Segment zero has bias 8 and shift zero, avoiding a negative shift.
	// All other segments reproduce the reference bias and scaling.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int bias = seg ? 264 : 8;
	int shift = seg ? seg - 1 : 0;
	int t = ((x & 15) * 16 + bias) << shift;

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
