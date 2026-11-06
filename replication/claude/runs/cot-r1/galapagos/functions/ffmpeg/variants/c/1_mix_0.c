#include <stdint.h>

__attribute__((noinline))
static int mix(int c0, int c1)
{
    // Blends two 15-bit RGB555 colors 2:1 (c0 weighted twice) per channel, each divided by 3.
    // Approach: extract the 5-bit fields with shift+mask before weighting.
    // ((c0 & 0x03E0) >> 5) equals (c0 >> 5) & 31, and the weighted green sum is a multiple of 32,
    // so shifting the fields first gives the same green value as shifting the sum.
    // Red keeps c0 >> 10 and c1 >> 10 unmasked and uses / 3, so any high or sign bits
    // behave exactly as in the reference, including truncation toward zero for negatives.
    int b0 = c0 & 31, b1 = c1 & 31;
    int g0 = (c0 >> 5) & 31, g1 = (c1 >> 5) & 31;
    int r = 2 * (c0 >> 10) + (c1 >> 10);
    int g = 2 * g0 + g1;
    int b = 2 * b0 + b1;
    return r / 3 * 1024 + g / 3 * 32 + b / 3;
}


int main(){
    mix(0,0);
}
