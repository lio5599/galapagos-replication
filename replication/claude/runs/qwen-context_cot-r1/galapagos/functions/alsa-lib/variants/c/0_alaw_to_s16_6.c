#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Uses arithmetic to compute shift amount without subtraction.
// Shifts by seg instead of seg-1 and adjusts base accordingly.
// This avoids the seg-1 calculation which can be error-prone.
// XOR 0x55 is standard for A-law bit reversal.
// Sign applied based on original sign bit.
{
	int t;
	int seg;
	int result;
	a_val ^= 0x55;
	t = a_val & 0x7f;
	if (t < 16) {
		result = (t << 4) + 8;
	} else {
		seg = (t >> 4) & 0x07;
		result = ((t & 0x0f) << 4) + 0x100;
		result <<= seg;
	}
	return ((a_val & 0x80) ? result : -result);
}


int main(){
    alaw_to_s16('a');
}
