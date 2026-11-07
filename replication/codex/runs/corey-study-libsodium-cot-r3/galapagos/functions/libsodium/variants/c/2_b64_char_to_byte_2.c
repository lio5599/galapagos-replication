#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // A loop evaluates the same three range contributions using parameter arrays.
    // Each mask is the complemented eighth-through-fifteenth difference bits.
    // The punctuation and zero-result correction retain the original XOR arithmetic.
    // No byte-range assumption is made, including for negative int inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int lo[3] = {'A', 'a', '0'};
    const unsigned int hi[3] = {'Z', 'z', '9'};
    const unsigned int offset[3] = {0U, 26U, 52U};
    unsigned int x = 0U;
    unsigned int i;

    for (i = 0U; i < 3U; ++i) {
        const unsigned int lower = u - lo[i];
        const unsigned int upper = hi[i] - u;
        const unsigned int mask = ~((lower | upper) >> 8) & 255U;
        x |= mask & (lower + offset[i]);
    }
    x |= ~((0U - (u ^ (unsigned int)'+')) >> 8) & 62U;
    x |= ~((0U - (u ^ (unsigned int)'/')) >> 8) & 63U;
    return x | ((x == 0U) ? (((0U - (u ^ (unsigned int)'A')) >> 8) & 255U) : 0U);
}


int main(){
    b64_char_to_byte(0);
}
