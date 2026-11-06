#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	// Uses tables: value = base[seg] + m*step[seg].
	// For seg>=1: (264+16m)<<(s-1) = (264<<(s-1)) + m*(16<<(s-1)).
	// For seg 0: base 8 and step 16 give 16m+8.
	// Bases: 8,264,528,1056,2112,4224,8448,16896. Steps: 16,16,32,...,1024.
	static const int base[8] = { 8, 264, 528, 1056, 2112, 4224, 8448, 16896 };
	static const int step[8] = { 16, 16, 32, 64, 128, 256, 512, 1024 };
	int v = (a_val ^ 0x55) & 0xff;
	int seg = (v >> 4) & 7;
	int t = base[seg] + (v & 0x0f) * step[seg];
	return (v & 0x80) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
