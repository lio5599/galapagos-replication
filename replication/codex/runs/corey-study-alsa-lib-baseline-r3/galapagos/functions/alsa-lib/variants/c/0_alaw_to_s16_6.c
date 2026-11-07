#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
	int seg = ((a_val >> 4) ^ 5) & 7;
	int mantissa = (a_val ^ 5) & 15;
	int t;

	if (seg == 0)
		t = mantissa * 16 + 8;
	else
		t = (mantissa * 2 + 33) << (seg + 2);

	return (a_val & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
