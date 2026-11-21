#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // A do-while loop performs the same rounds and stops after shift zero.
    // Subtracting three happens only when another round remains.
    // The arithmetic and decisions match the reference for every input.
    uint64_t r = 0;
    int s = 63;
    do {
        r <<= 1;
        uint64_t b = 3 * r * (r + 1) + 1;
        if ((x >> s) >= b) {
            x -= b << s;
            ++r;
        }
        if (s == 0)
            break;
        s -= 3;
    } while (1);
    return r << 12;
}


int main(){
    icbrt64(0);
}
