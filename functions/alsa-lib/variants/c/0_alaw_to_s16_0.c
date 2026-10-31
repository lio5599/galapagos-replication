#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int		t;
	int		seg;

	a_val ^= 0x55;
	t = a_val & 0x7f;
	seg = (t >> 4) & 0x07;
	if (seg == 0)
		t = (t << 4) + 8;
	else
		t = (((t & 0x0f) << 4) + 0x108) << (seg - 1);
	return ((a_val & 0x80) ? t : -t);
}


int main(){
    alaw_to_s16('a');
}
