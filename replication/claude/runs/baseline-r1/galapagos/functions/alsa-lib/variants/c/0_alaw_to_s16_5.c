#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int v = a_val ^ 0x55;
	int m = ((v & 0x0f) << 4);
	int t;

	switch ((v >> 4) & 0x07) {
	case 0: t = m + 8; break;
	case 1: t = m + 0x108; break;
	case 2: t = (m + 0x108) << 1; break;
	case 3: t = (m + 0x108) << 2; break;
	case 4: t = (m + 0x108) << 3; break;
	case 5: t = (m + 0x108) << 4; break;
	case 6: t = (m + 0x108) << 5; break;
	default: t = (m + 0x108) << 6; break;
	}
	return (v & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
