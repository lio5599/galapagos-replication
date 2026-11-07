#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Replace the variable left shift with repeated doubling.
	// Segment zero uses its own bias; segment one requires no doubling.
	// Larger segments perform exactly seg minus one doublings.
	// Intermediate magnitudes never exceed the final maximum of 32256.
	int u = a_val ^ 0x55;
	int seg = (u >> 4) & 7;
	int t = (u & 15) * 16 + 8;

	if (seg != 0) {
		t += 256;
		while (seg > 1) {
			t += t;
			--seg;
		}
	}
	return (u & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
