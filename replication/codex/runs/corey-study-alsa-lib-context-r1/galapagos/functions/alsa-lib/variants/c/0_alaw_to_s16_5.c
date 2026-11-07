#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int shift = seg ? seg - 1 : 0;
	int t = (((x & 15) << 4) + 264) << shift;

	if (seg == 0)
		t -= 256;
	if (!(x & 128))
		t = -t;

	return t;
}


int main(){
    alaw_to_s16('a');
}
