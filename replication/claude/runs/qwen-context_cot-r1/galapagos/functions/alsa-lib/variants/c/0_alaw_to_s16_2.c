#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
// Uses switch statement for segment handling instead of if-else.
// Each case computes the linear value for that segment.
// XOR 0x55 is standard A-law bit reversal.
// Sign bit determines final sign of result.
// All 8 segments handled explicitly for clarity.
{
	int t;
	int result;
	a_val ^= 0x55;
	t = a_val & 0x7f;
	if (t < 16) {
		result = (t << 4) + 8;
	} else {
		switch ((t >> 4) & 0x07) {
			case 0: result = ((t & 0x0f) << 4) + 0x100; break;
			case 1: result = (((t & 0x0f) << 4) + 0x100) << 1; break;
			case 2: result = (((t & 0x0f) << 4) + 0x100) << 2; break;
			case 3: result = (((t & 0x0f) << 4) + 0x100) << 3; break;
			case 4: result = (((t & 0x0f) << 4) + 0x100) << 4; break;
			case 5: result = (((t & 0x0f) << 4) + 0x100) << 5; break;
			case 6: result = (((t & 0x0f) << 4) + 0x100) << 6; break;
			case 7: result = (((t & 0x0f) << 4) + 0x100) << 7; break;
			default: result = 0; break;
		}
	}
	return ((a_val & 0x80) ? result : -result);
}


int main(){
    alaw_to_s16('a');
}
