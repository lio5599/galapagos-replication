#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Replace magnitude shifting with multiplication by a power of two.
	// Segment zero is handled separately, so every shift count is valid.
	// Products remain between 8 and 32256, matching all reference magnitudes.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int t = (x & 15) * 16 + 8;

	if (seg != 0)
		t = (t + 256) * (1 << (seg - 1));

	if (x & 128)
		return t;
	return -t;
}


int main(){
    alaw_to_s16('a');
}
