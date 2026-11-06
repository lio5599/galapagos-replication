#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Approach: a table-driven loop over the three range thresholds 26, 52, 62 and their offsets.
    // Each step ORs prev & m & (x + off), where prev is the complement of the previous mask.
    // For the first step prev starts at 0xFF, which reproduces the reference's first term exactly.
    // The offset -4 is stored as an unsigned value, so x + off wraps the same way x + ('0' - 52) does.
    // A second loop adds the equality terms for 62 and 63, so all inputs give identical results.
    static const unsigned int lim[3] = { 26U, 52U, 62U };
    static const unsigned int off[3] = { 'A', 'a' - 26, (unsigned int) ('0' - 52) };
    static const unsigned int eqv[2] = { 62U, 63U };
    static const unsigned int chr[2] = { '+', '/' };
    unsigned int r = 0U, prev = 0xFFU, m;
    int i;
    for (i = 0; i < 3; i++) {
        m = ((x - lim[i]) >> 8) & 0xFFU;
        r |= prev & m & (x + off[i]);
        prev = m ^ 0xFFU;
    }
    for (i = 0; i < 2; i++)
        r |= ((((0U - (x ^ eqv[i])) >> 8) & 0xFFU) ^ 0xFFU) & chr[i];
    return (int) r;
}


int main(){
    b64_byte_to_char(0);
}
