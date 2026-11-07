#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Compute the original five terms, then assemble their union bit by bit.
    // No term has bits above bit seven, so eight iterations recover the exact x.
    // The unchanged final correction handles A, invalid bytes, and non-byte c.
    // Unsigned differences preserve every reference-defined result.
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
    unsigned int x = 0U;
    unsigned int bit;
    unsigned int i;
    for (bit = 0U; bit < 8U; ++bit) {
        for (i = 0U; i < 5U; ++i) {
            if ((term[i] & (1U << bit)) != 0U) {
                x |= 1U << bit;
                break;
            }
        }
    }
    return x |
        ((255U ^ (((0U - x) >> 8) & 255U)) &
         (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
