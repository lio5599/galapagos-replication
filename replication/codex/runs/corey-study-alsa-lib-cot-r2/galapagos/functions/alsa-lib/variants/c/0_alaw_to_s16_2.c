#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Each segment is an arithmetic progression indexed by the mantissa.
	// The tables contain the reference's scaled bias and mantissa step.
	// Entry zero captures its special case, and all indices stay in range.
	// The original sign selection also covers the smallest and largest codes.
	static const int base[8] = {
		8, 264, 528, 1056, 2112, 4224, 8448, 16896
	};
	static const int step[8] = {
		16, 16, 32, 64, 128, 256, 512, 1024
	};
	int u = a_val ^ 0x55;
	int seg = (u >> 4) & 7;
	int t = base[seg] + (u & 15) * step[seg];

	return (u & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
