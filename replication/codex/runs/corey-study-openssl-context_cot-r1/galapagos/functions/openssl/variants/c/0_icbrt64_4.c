#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Expands the trial polynomial to 3*r*r + 3*r + 1.
    // Unsigned arithmetic gives the same trial value as the factored form.
    // Failed trials skip the update; successful trials match the reference.
    // The shift sequence and final scaling are unchanged for all inputs.
    uint64_t r = 0;
    int s;

    for (s = 63; s >= 0; s -= 3) {
        uint64_t b;
        r <<= 1;
        b = 3 * r * r + 3 * r + 1;
        if ((x >> s) < b)
            continue;
        x -= b << s;
        ++r;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
