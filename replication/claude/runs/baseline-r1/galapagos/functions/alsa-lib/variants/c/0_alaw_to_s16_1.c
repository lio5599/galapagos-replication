#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int v = a_val ^ 0x55;
	int seg = (v >> 4) & 0x07;
	int mant = v & 0x0f;
	int t;

	if (seg)
		t = ((mant << 1) | 0x21) << (seg + 2);
	else
		t = ((mant << 1) | 1) << 3;
	return (v & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
