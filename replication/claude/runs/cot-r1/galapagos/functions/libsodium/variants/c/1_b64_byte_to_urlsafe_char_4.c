#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Approach: sum the products of 0/1 range predicates and per-range values.
    // The ranges are disjoint, so at most one product is nonzero, like the OR.
    // Unsigned x-26<26 and x-52<10 wrap for small x, which keeps them exact.
    // A wrapped x-4 is multiplied by 0, so it adds nothing. 64..255 sum to 0.
    return (int) ((x < 26) * (x + 'A') + (x - 26 < 26) * (x + ('a' - 26)) +
                  (x - 52 < 10) * (x - 4) + (x == 62) * (unsigned int) '-' +
                  (x == 63) * (unsigned int) '_');
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
