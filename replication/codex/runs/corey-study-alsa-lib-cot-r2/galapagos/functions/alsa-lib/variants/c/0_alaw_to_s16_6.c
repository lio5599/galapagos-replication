#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Build the magnitude from the four mantissa bits and their weights.
	// Scaling the bias and each weight separately distributes the same shift.
	// Segment zero uses scale one and bias eight, avoiding a negative shift.
	// The integer sign multiplier is exactly minus one or plus one.
	int u = a_val ^ 0x55;
	int seg = (u >> 4) & 7;
	int scale = (seg == 0) ? 1 : (1 << (seg - 1));
	int t = ((seg == 0) ? 8 : 264) * scale;

	if (u & 1)
		t += 16 * scale;
	if (u & 2)
		t += 32 * scale;
	if (u & 4)
		t += 64 * scale;
	if (u & 8)
		t += 128 * scale;
	return t * (2 * (u >> 7) - 1);
}


int main(){
    alaw_to_s16('a');
}
