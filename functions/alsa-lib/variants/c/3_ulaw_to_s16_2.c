#include <stdint.h>

__attribute__((noinline))
static int ulaw_to_s16(unsigned char u_val)
{
	int u = (~u_val) & 0xff;
	int exponent = (u >> 4) & 0x07;
	int t = (((u & 0x0f) << 3) + 0x84) * (1 << exponent);
	int mag = t - 0x84;

	return (u & 0x80) ? (0 - mag) : mag;
}


int main(){
    ulaw_to_s16('a');
}
