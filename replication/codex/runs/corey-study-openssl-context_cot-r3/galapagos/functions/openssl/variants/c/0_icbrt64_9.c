#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Keeps the doubled root separate until the trial has been decided.
    // The next root is twice the old root plus the successful-trial bit.
    // Identical thresholds and remainder updates cover all input values.
    uint64_t r = 0;
    for (int s = 63; s >= 0; s -= 3) {
        uint64_t doubled = r << 1;
        uint64_t b = 3 * doubled * (doubled + 1) + 1;
        uint64_t take = (uint64_t)((x >> s) >= b);
        if (take != 0)
            x -= b << s;
        r = doubled | take;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
