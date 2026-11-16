#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Decompresses A-law audio sample to signed 16-bit value.
	// Bit inversion via XOR 0x55 prepares for magnitude decoding.
	// Low magnitude values expanded with shift and add.
	// High magnitude values use segment-based shift after offset.
	// Original sign bit applied at end for correct polarity.
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
	return (a_val & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
