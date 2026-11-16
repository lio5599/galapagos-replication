#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Converts A-law compressed 8-bit audio sample to 16-bit signed PCM.
	// XORs with 0x55 to invert bits, extracts magnitude and sign.
	// For low values (t<16), linear expansion; else uses segment decoding.
	// Sign bit determines positive/negative output. Equivalent to reference.
	int t;
	int seg;

	a_val ^= 0x55;
	t = a_val & 0x7f;
	if (t < 16)
		t = (t << 4) + 8;
	else {
		seg = (t >> 4) & 0x07;
		t = ((t & 0x0f) << 4) + 0x108;
		t <<= seg - 1;
	}
	return ((a_val & 0x80) ? t : -t);
}


int main(){
    alaw_to_s16('a');
}
