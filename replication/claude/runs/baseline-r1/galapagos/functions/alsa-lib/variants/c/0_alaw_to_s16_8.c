#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	unsigned int v = (unsigned int)(a_val ^ 0x55);
	unsigned int seg = (v >> 4) & 7u;
	unsigned int mag;
	int t;

	mag = ((v & 0x0fu) << 4) | 8u;
	if (seg > 0) {
		mag |= 0x100u;
		mag <<= (seg - 1);
	}
	t = (int)mag;
	if (!(v & 0x80u))
		t = -t;
	return t;
}


int main(){
    alaw_to_s16('a');
}
