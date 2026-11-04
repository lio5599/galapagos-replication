#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 0x07;
	int mant = x & 0x0f;
	int mag;

	if (seg == 0)
		mag = (mant << 4) + 8;
	else
		mag = ((mant << 4) + 0x108) << (seg - 1);
	return (x & 0x80) ? mag : -mag;
}


int main(){
    alaw_to_s16('a');
}
