#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int v = a_val ^ 0x55;
	int seg = (v >> 4) & 0x07;
	int nz = (seg != 0);
	int t = (((v & 0x0f) << 4) + 8 + (nz << 8)) << (seg - nz);

	return (v & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
