#include <stdint.h>

__attribute__((noinline))
static int ulaw_to_s16(unsigned char u_val)
{
	unsigned char u = (unsigned char)~u_val;
	int mantissa = u & 0x0f;
	int exponent = (u >> 4) & 0x07;
	int t = ((mantissa << 3) + 0x84) << exponent;

	if (u & 0x80)
		return 0x84 - t;
	return t - 0x84;
}


int main(){
    ulaw_to_s16('a');
}
