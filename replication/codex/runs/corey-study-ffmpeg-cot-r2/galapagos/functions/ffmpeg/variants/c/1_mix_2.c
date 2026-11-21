#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Arrays hold the extracted channels, and a loop applies the same weighted average.
    // Extracting green before averaging is exact because its masked bits are multiples of 32.
    // Red is not masked; negative values keep the original signed shift and truncation.
    // Reconstruction keeps the reference order, including at channel endpoints.
    int first[3];
    int second[3];
    int averaged[3];
    int i;
    first[0] = c0 & 0x001F;
    first[1] = (c0 & 0x03E0) >> 5;
    first[2] = c0 >> 10;
    second[0] = c1 & 0x001F;
    second[1] = (c1 & 0x03E0) >> 5;
    second[2] = c1 >> 10;
    for (i = 0; i < 3; ++i)
        averaged[i] = (2 * first[i] + second[i]) / 3;
    return averaged[2] * 1024 + averaged[1] * 32 + averaged[0];
}


int main(){
    mix(0,0);
}
