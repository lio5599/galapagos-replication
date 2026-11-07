#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Fold the five masked terms using a XOR b XOR their intersection.
    // That identity equals bitwise OR even when non-byte inputs overlap terms.
    // Thus x and the original final correction are unchanged, including for A.
    // Unsigned candidate differences match every reference-defined input.
    const unsigned int u = (unsigned int)c;
    const unsigned int term[5] = {
        ((~((u - 'A') | ('Z' - u)) >> 8) & 255U) & (u - 'A'),
        ((~((u - 'a') | ('z' - u)) >> 8) & 255U) &
            (u - 'a' + 26U),
        ((~((u - '0') | ('9' - u)) >> 8) & 255U) &
            (u - '0' + 52U),
        ((~(0U - (u ^ '+')) >> 8) & 255U) & 62U,
        ((~(0U - (u ^ '/')) >> 8) & 255U) & 63U
    };
    unsigned int x = term[0];
    unsigned int i;
    for (i = 1U; i < 5U; ++i)
        x = x ^ term[i] ^ (x & term[i]);
    return x |
        ((255U ^ (((0U - x) >> 8) & 255U)) &
         (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
