#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    const unsigned int u = (unsigned int)c;
    const unsigned int a = u - 'A';
    const unsigned int b = u - 'a';
    const unsigned int d = u - '0';
    const unsigned int upper =
        255U ^ (((a | ((unsigned int)('Z' - 'A') - a)) >> 8) & 255U);
    const unsigned int lower =
        255U ^ (((b | ((unsigned int)('z' - 'a') - b)) >> 8) & 255U);
    const unsigned int digit =
        255U ^ (((d | ((unsigned int)('9' - '0') - d)) >> 8) & 255U);
    const unsigned int x =
        (upper & a) | (lower & (b + 26U)) | (digit & (d + 52U)) |
        ((255U ^ (((0U - (u ^ '+')) >> 8) & 255U)) & 62U) |
        ((255U ^ (((0U - (u ^ '/')) >> 8) & 255U)) & 63U);

    return x | ((0U - (unsigned int)(x == 0U)) &
                ((0U - (u ^ 'A')) >> 8) & 255U);
}


int main(){
    b64_char_to_byte(0);
}
