#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Start every segment with the larger bias and a nonnegative shift.
	// For segment zero, subtract 256 afterward to change bias 264 into eight.
	// All other segments retain exactly the reference's biased shift.
	// The temporary and final magnitudes fit even when int is 16 bits.
	int u = a_val ^ 0x55;
	int seg = (u >> 4) & 7;
	int shift = (seg > 0) ? seg - 1 : 0;
	int t = ((u & 15) * 16 + 264) << shift;

	t -= (seg == 0) * 256;
	return (u & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
