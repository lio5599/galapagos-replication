#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    static const unsigned int first[3] = {'A', 'a', '0'};
    static const unsigned int last[3] = {'Z', 'z', '9'};
    static const unsigned int offset[3] = {0U, 26U, 52U};
    unsigned int u = (unsigned int)c;
    unsigned int x = 0U;
    unsigned int i = 0U;

    do {
        unsigned int lo = (u - first[i]) >> 8;
        unsigned int hi = (last[i] - u) >> 8;
        unsigned int value = u - first[i] + offset[i];
        x |= value & (255U ^ ((lo | hi) & 255U));
        ++i;
    } while (i < 3U);

    x |= (255U ^ (((0U - (u ^ '+')) >> 8) & 255U)) & 62U;
    x |= (255U ^ (((0U - (u ^ '/')) >> 8) & 255U)) & 63U;

    return x | ((255U ^ (((0U - x) >> 8) & 255U)) &
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
