#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Approach: count the thresholds 26, 52, 62, 63 and 64 that x reaches.
    // That count picks the offset to add: +65, +71, -4, -17 or +32.
    // Check: 62-17 = 45 = '-' and 63+32 = 95 = '_'.
    // A count of 5 means x >= 64, which returns 0 like the reference.
    static const int off[5] = { 65, 71, -4, -17, 32 };
    unsigned int i = (x >= 26) + (x >= 52) + (x >= 62) + (x >= 63) + (x >= 64);
    if (i == 5) return 0;
    return (int) x + off[i];
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
