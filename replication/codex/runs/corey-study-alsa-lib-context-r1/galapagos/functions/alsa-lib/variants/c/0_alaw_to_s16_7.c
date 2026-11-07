#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int x = a_val ^ 0x55;
	int code = x & 127;
	int t;

	if (code < 16)
		t = code * 16 + 8;
	else if (code < 32)
		t = (code - 16) * 16 + 264;
	else if (code < 48)
		t = (code - 32) * 32 + 528;
	else if (code < 64)
		t = (code - 48) * 64 + 1056;
	else if (code < 80)
		t = (code - 64) * 128 + 2112;
	else if (code < 96)
		t = (code - 80) * 256 + 4224;
	else if (code < 112)
		t = (code - 96) * 512 + 8448;
	else
		t = (code - 112) * 1024 + 16896;

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
