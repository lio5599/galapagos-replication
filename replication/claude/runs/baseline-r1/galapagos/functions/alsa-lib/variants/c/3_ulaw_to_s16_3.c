#include <stdint.h>

__attribute__((noinline))
static int ulaw_to_s16(unsigned char u_val)
{
	static const int bias[8] = { 0, 132, 396, 924, 1980, 4092, 8316, 16764 };
	int u = u_val ^ 0xff;
	int exponent = (u >> 4) & 0x07;
	int mag = ((u & 0x0f) << (exponent + 3)) + bias[exponent];

	return (u & 0x80) ? -mag : mag;
}


int main(){
    ulaw_to_s16('a');
}
