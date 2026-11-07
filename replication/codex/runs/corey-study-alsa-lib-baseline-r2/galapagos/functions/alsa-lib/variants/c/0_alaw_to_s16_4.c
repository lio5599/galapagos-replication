#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int segment;
	int mantissa;
	int magnitude;

	segment = ((a_val >> 4) ^ 5) & 7;
	mantissa = (a_val ^ 5) & 15;

	if (segment == 0)
		magnitude = mantissa * 16 + 8;
	else
		magnitude = (mantissa * 2 + 33) << (segment + 2);

	return (a_val & 128) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
