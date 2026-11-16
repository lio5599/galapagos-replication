#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Computes integer cube root of x scaled by 2^12.
    // Same algorithm with b computed using expanded form.
    // 3*r*(r+1)+1 equals 3*r*r + 3*r + 1 which is (r+1)^3 - r^3.
    // This is the standard digit-by-digit cube root algorithm.
    uint64_t r = 0;
    uint64_t b;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        r <<= 1;
        b = 3 * r * r + 3 * r + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            r++;
        }
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
