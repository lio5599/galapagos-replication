#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Computes segment shift amount directly using arithmetic.
// Avoids explicit switch by calculating shift from segment number.
// Base offset 0x100 is added before shifting for segments >= 1.
// XOR 0x55 prepares the A-law code for decoding.
// Sign applied at end based on MSB.
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
