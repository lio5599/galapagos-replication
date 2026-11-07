#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int starts[3] = {'A', 'a', '0'};
    const unsigned int ends[3] = {'Z', 'z', '9'};
    const unsigned int offsets[3] = {0U, 26U, 52U};
    const unsigned int symbols[2] = {'+', '/'};
    const unsigned int values[2] = {62U, 63U};
    unsigned int x = 0U;
    unsigned int i = 3U;

    while (i != 0U) {
        unsigned int value;
        unsigned int rejected;

        --i;
        value = (u - starts[i] + offsets[i]) & 255U;
        rejected = ((u - starts[i]) | (ends[i] - u)) >> 8;
        x |= value ^ (value & rejected);
    }

    for (i = 0U; i < 2U; ++i) {
        const unsigned int rejected = (0U - (u ^ symbols[i])) >> 8;
        x |= values[i] ^ (values[i] & rejected);
    }

    if (x != 0U)
        return x;

    return ((0U - (u ^ 'A')) >> 8) & 255U;
}


int main(){
    b64_char_to_byte(0);
}
