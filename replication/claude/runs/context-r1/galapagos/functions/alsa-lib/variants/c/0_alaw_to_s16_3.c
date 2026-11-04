#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int x = a_val ^ 0x55;
	int m = x & 0x0f;
	int t;

	switch ((x >> 4) & 0x07) {
	case 0:
		t = (m << 4) + 0x8;
		break;
	case 1:
		t = (m << 4) + 0x108;
		break;
	case 2:
		t = (m << 5) + 0x210;
		break;
	case 3:
		t = (m << 6) + 0x420;
		break;
	case 4:
		t = (m << 7) + 0x840;
		break;
	case 5:
		t = (m << 8) + 0x1080;
		break;
	case 6:
		t = (m << 9) + 0x2100;
		break;
	default:
		t = (m << 10) + 0x4200;
		break;
	}
	return (x & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
