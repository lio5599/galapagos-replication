#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Approach: fill a 256-entry lookup table on the first call, then index it.
	// Each entry is computed with exactly the reference algorithm.
	// All 256 possible inputs are covered, so every result matches the reference.
	static int table[256];
	static int ready = 0;
	if (!ready) {
		int i;
		for (i = 0; i < 256; i++) {
			int v = i ^ 0x55;
			int t = v & 0x7f;
			if (t < 16)
				t = (t << 4) + 8;
			else {
				int seg = (t >> 4) & 0x07;
				t = ((t & 0x0f) << 4) + 0x108;
				t <<= seg - 1;
			}
			table[i] = (v & 0x80) ? t : -t;
		}
		ready = 1;
	}
	return table[a_val];
}


int main(){
    alaw_to_s16('a');
}
