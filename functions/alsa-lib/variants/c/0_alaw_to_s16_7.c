#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int v = a_val ^ 0x55;
	int seg = (v >> 4) & 0x07;
	int t;
	int i;

	if (seg == 0) {
		t = ((v & 0x0f) << 4) + 8;
	} else {
		t = ((v & 0x0f) << 4) + 0x108;
		for (i = 1; i < seg; i++)
			t += t;
	}
	return (v & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
