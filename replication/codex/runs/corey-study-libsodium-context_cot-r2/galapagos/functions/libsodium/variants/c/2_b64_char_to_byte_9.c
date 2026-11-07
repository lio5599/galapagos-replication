#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Cache unsigned offsets and derive upper-bound differences from those offsets.
    // Unsigned modular arithmetic makes each derived difference identical to the original.
    // Mask extraction and the final correction preserve even non-byte input behavior.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = u - (unsigned int)'A';
    const unsigned int b = u - (unsigned int)'a';
    const unsigned int d = u - (unsigned int)'0';
    const unsigned int ar = ((unsigned int)'Z' - (unsigned int)'A') - a;
    const unsigned int br = ((unsigned int)'z' - (unsigned int)'a') - b;
    const unsigned int dr = ((unsigned int)'9' - (unsigned int)'0') - d;
    unsigned int x = ((~(a | ar) >> 8) & 255U) & a;
    x |= ((~(b | br) >> 8) & 255U) & (b + 26U);
    x |= ((~(d | dr) >> 8) & 255U) & (d + 52U);
    x |= ((~(0U - (u ^ '+')) >> 8) & 255U) & 62U;
    x |= ((~(0U - (u ^ '/')) >> 8) & 255U) & 63U;
    return x | (((~(0U - x) >> 8) & 255U) &
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
