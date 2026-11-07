#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	unsigned int x = a_val ^ 0x55u;
	int seg = (x >> 4) & 7;
	int t = ((int)(x & 15) * 2 + 33) << (seg + 3);

	if (seg == 0)
		t -= 256;
	else
		t /= 2;

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
