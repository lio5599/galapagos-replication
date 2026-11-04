#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	unsigned char x = a_val ^ 0x55;
	int t = x & 0x7f;
	int mag;

	if (t >= 16) {
		int seg = (t >> 4) & 0x07;
		mag = (((t & 0x0f) << 4) + 0x108) << (seg - 1);
	} else {
		mag = (t << 4) + 8;
	}
	if (x & 0x80)
		return mag;
	return -mag;
}


int main(){
    alaw_to_s16('a');
}
