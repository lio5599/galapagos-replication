#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 0x07;
	int t = (((x & 0x0f) * 2) + 1 + (seg ? 32 : 0)) << 3;

	if (seg > 1)
		t <<= seg - 1;
	return (x & 0x80) ? t : 0 - t;
}


int main(){
    alaw_to_s16('a');
}
