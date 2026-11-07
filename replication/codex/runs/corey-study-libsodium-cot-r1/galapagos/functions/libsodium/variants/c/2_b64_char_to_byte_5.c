#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Transform all nine input-dependent differences into masks in one loop.
    // Combining those masks reproduces the reference's original grouping.
    // Keeping every mask bit preserves invalid-byte and wider-input behavior.
    unsigned int u = (unsigned int)c;
    unsigned int m[9] = {
        u - 'A', 'Z' - u, u - 'a', 'z' - u,
        u - '0', '9' - u, 0U - (u ^ '+'),
        0U - (u ^ '/'), 0U - (u ^ 'A')
    };
    unsigned int i;
    unsigned int x;
    for (i = 0U; i < 9U; ++i)
        m[i] = 255U ^ ((m[i] >> 8) & 255U);
    x = (m[0] & m[1] & (u - 'A'))
      | (m[2] & m[3] & (u - 'a' + 26U))
      | (m[4] & m[5] & (u - '0' + 52U))
      | (m[6] & 62U) | (m[7] & 63U);
    return x | ((255U ^ (((0U - x) >> 8) & 255U))
              & (m[8] ^ 255U));
}


int main(){
    b64_char_to_byte(0);
}
