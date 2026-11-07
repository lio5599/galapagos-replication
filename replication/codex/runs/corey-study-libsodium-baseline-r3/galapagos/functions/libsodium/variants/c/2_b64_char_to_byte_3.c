#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    static const unsigned int bounds[3][3] = {
        {'A', 'Z', 0U},
        {'a', 'z', 26U},
        {'0', '9', 52U}
    };
    unsigned int u = (unsigned int)c;
    unsigned int x = 0U;
    unsigned int i;

    for (i = 0U; i < 3U; ++i) {
        unsigned int delta = u - bounds[i][0];
        unsigned int mask =
            ~((delta | (bounds[i][1] - u)) >> 8) & 255U;
        x |= mask & (delta + bounds[i][2]);
    }

    x |= 62U & ~((0U - (u ^ '+')) >> 8);
    x |= 63U & ~((0U - (u ^ '/')) >> 8);

    return x != 0U ? x : (((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
