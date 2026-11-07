#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	static const int scale[8] = { 1, 1, 2, 4, 8, 16, 32, 64 };
	int value;
	int segment;
	int magnitude;

	value = a_val ^ 0x55;
	segment = (value >> 4) & 7;
	magnitude = ((value & 15) * 16 + 264) * scale[segment];
	if (segment == 0)
		magnitude -= 256;

	return (value & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
