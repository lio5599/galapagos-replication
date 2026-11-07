#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Decodes an A-law byte into a signed 16-bit PCM sample returned as int.
	// Segment zero uses the unscaled midpoint; other segments add the bias.
	// The largest magnitude is 32256, and the sign bit selects polarity.
	int x = a_val ^ 0x55;
	int seg = (x >> 4) & 7;
	int mant = x & 15;
	int t;

	if (seg == 0)
		t = (mant << 4) + 8;
	else
		t = ((mant << 4) + 264) << (seg - 1);

	return (x & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
