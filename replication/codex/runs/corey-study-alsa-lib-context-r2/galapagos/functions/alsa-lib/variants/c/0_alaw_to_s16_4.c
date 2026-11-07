#include <stdint.h>

__attribute__((noinline))
static int alaw_to_s16(unsigned char a_val)
{
    int n = (a_val & 15) ^ 5;
    int seg = ((a_val >> 4) & 7) ^ 5;
    int t = n * 16 + 8;

    if (seg > 0)
        t = (t + 256) << (seg - 1);

    return (a_val & 128) ? t : -t;
}


int main(){
    alaw_to_s16('a');
}
