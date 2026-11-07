#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	static const int base[8] = {
		8, 264, 528, 1056, 2112, 4224, 8448, 16896
	};
	static const int step[8] = {
		16, 16, 32, 64, 128, 256, 512, 1024
	};
	int value;
	int segment;
	int magnitude;

	value = a_val ^ 0x55;
	segment = (value >> 4) & 7;
	magnitude = base[segment] + (value & 15) * step[segment];

	return (value & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
