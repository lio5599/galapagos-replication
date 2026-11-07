#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int value;
	int segment;
	int magnitude;

	value = a_val ^ 0x55;
	segment = (value >> 4) & 7;
	magnitude = (value & 15) * 16 + 8;

	if (segment > 0) {
		magnitude += 256;
		while (--segment > 0)
			magnitude *= 2;
	}

	if (!(value & 128))
		magnitude = -magnitude;
	return magnitude;
}


int main(){
    alaw_to_s16('a');
}
