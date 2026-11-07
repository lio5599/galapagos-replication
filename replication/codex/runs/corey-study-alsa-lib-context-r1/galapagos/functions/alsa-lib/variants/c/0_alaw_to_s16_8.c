#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int t;

	if (seg == 0) {
		t = ((x & 15) << 4) + 8;
	} else {
		int shift = seg - 1;
		t = ((x & 15) << 4) + 264;
		if (shift & 1)
			t <<= 1;
		if (shift & 2)
			t <<= 2;
		if (shift & 4)
			t <<= 4;
	}

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
