#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int ranges[3][3] = {
        { '0', '9', 52U },
        { 'a', 'z', 26U },
        { 'A', 'Z', 0U }
    };
    unsigned int x = (~((0U - (u ^ '/')) >> 8) & 63U)
                   | (~((0U - (u ^ '+')) >> 8) & 62U);
    unsigned int i = 3U;

    while (i != 0U) {
        unsigned int lower;
        unsigned int upper;

        --i;
        lower = u - ranges[i][0];
        upper = ranges[i][1] - u;
        x |= (~((lower | upper) >> 8) & 255U)
           & (lower + ranges[i][2]);
    }

    return x + (unsigned int)(x == 0U)
             * (((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
