#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Greedily subtract three times descending powers of two.
    // Numerators at most 93 need quotient bits only from 16 down to 1.
    // The remaining value is below three, giving exact floor division.
    // Red keeps signed division, including truncation toward zero.
    int n[2] = {
        2 * (c0 & 31) + (c1 & 31),
        (2 * (c0 & 0x03E0) + (c1 & 0x03E0)) >> 5
    };
    int q[2] = { 0, 0 };
    int red = 2 * (c0 >> 10) + (c1 >> 10);
    int i;
    int bit;
    for (i = 0; i < 2; ++i) {
        for (bit = 16; bit != 0; bit >>= 1) {
            if (n[i] >= 3 * bit) {
                n[i] -= 3 * bit;
                q[i] += bit;
            }
        }
    }
    return red / 3 * 1024 + q[1] * 32 + q[0];
}


int main(){
    mix(0,0);
}
