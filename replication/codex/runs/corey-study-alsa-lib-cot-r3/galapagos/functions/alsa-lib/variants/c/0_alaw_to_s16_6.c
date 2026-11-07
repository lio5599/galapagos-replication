#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Replace the exponent shift with repeated doubling of the magnitude.
	// Segment zero keeps bias 8; all other segments first add 256.
	// Segments zero and one perform no doubling, exactly as required.
	// At most six doublings occur and no intermediate exceeds 32256.
	int decoded = a_val ^ 0x55;
	int segment = (decoded >> 4) & 7;
	int magnitude = (decoded & 15) * 16 + 8;

	if (segment > 0)
		magnitude += 256;
	while (segment > 1) {
		magnitude += magnitude;
		--segment;
	}
	return (decoded & 0x80) ? magnitude : -magnitude;
}


int main(){
    alaw_to_s16('a');
}
