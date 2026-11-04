#include <stdint.h>

__attribute__((noinline))
static int ulaw_to_s16(unsigned char u_val)
{
	int u = u_val ^ 0xff;
	int mantissa = u & 0x0f;
	int t;

	switch ((u >> 4) & 0x07) {
	case 0: t = (mantissa << 3) + 0x84; break;
	case 1: t = (mantissa << 4) + 0x108; break;
	case 2: t = (mantissa << 5) + 0x210; break;
	case 3: t = (mantissa << 6) + 0x420; break;
	case 4: t = (mantissa << 7) + 0x840; break;
	case 5: t = (mantissa << 8) + 0x1080; break;
	case 6: t = (mantissa << 9) + 0x2100; break;
	default: t = (mantissa << 10) + 0x4200; break;
	}

	t -= 0x84;
	return (u & 0x80) ? -t : t;
}


int main(){
    ulaw_to_s16('a');
}
