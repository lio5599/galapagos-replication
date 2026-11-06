#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Approach: classic g711.c style, with t = m<<4 and a switch adding the offset.
	// Case 0 adds 8, case 1 adds 0x108, and other segments add 0x108 then shift by seg-1.
	// This is the same arithmetic as the reference for every segment.
	// The sign is decided by bit 7 after the XOR, exactly as in the reference.
	int v = a_val ^ 0x55;
	int t = (v & 0x0f) << 4;
	int seg = (v & 0x70) >> 4;
	switch (seg) {
	case 0:
		t += 8;
		break;
	case 1:
		t += 0x108;
		break;
	default:
		t += 0x108;
		t <<= seg - 1;
	}
	return (v & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
