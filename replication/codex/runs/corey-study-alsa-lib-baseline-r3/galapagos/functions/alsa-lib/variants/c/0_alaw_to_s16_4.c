#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	unsigned int x = a_val ^ 0x55u;
	int seg = (x >> 4) & 7;
	int nonzero = (seg != 0);
	int t = ((int)(x & 15) * 16 + 8 + 256 * nonzero)
		<< (seg - nonzero);

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
