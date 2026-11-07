#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int starts[3] = {'A', 'a', '0'};
    const unsigned int ends[3] = {'Z', 'z', '9'};
    const unsigned int offsets[3] = {0U, 26U, 52U};
    unsigned int x = 0U;
    unsigned int i;

    for (i = 0U; i < 3U; ++i) {
        const unsigned int mask =
            ~(((u - starts[i]) | (ends[i] - u)) >> 8) & 255U;
        x |= mask & (u - starts[i] + offsets[i]);
    }

    x |= ~((0U - (u ^ '+')) >> 8) & 62U;
    x |= ~((0U - (u ^ '/')) >> 8) & 63U;

    if (x == 0U)
        return ((0U - (u ^ 'A')) >> 8) & 255U;
    return x;
}


int main(){
    b64_char_to_byte(0);
}
