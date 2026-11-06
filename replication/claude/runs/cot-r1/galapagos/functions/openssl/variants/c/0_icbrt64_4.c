#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Reference digit algorithm that also tracks y2 = y*y incrementally.
    // Doubling y multiplies y2 by 4, and y++ adds 2y+1 to y2.
    // So b = 3*(y2 + y) + 1 equals the reference's 3*r*(r+1) + 1.
    // The comparison and subtraction match the reference step for step, including x = 0.
    // The result is shifted left by 12.
    uint64_t y = 0, y2 = 0, b;
    int s;
    for (s = 63; s >= 0; s -= 3) {
        y2 <<= 2;
        y <<= 1;
        b = 3 * (y2 + y) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            y2 += 2 * y + 1;
            y++;
        }
    }
    return y << 12;
}


int main(){
    icbrt64(0);
}
