#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Build each complemented mask by clearing its extracted source bits from 255.
    // XOR inserts only previously absent contribution bits, exactly implementing OR.
    // This remains valid when contributions overlap for unusual int inputs.
    // Multiplication by the zero test selects the original eight-bit correction.
    const unsigned int u = (unsigned int)c;
    const unsigned int source[5] = {
        (u - (unsigned int)'A') | ((unsigned int)'Z' - u),
        (u - (unsigned int)'a') | ((unsigned int)'z' - u),
        (u - (unsigned int)'0') | ((unsigned int)'9' - u),
        0U - (u ^ (unsigned int)'+'),
        0U - (u ^ (unsigned int)'/')
    };
    const unsigned int value[5] = {
        u - (unsigned int)'A',
        u - ((unsigned int)'a' - 26U),
        u - ((unsigned int)'0' - 52U),
        62U, 63U
    };
    unsigned int x = 0U;
    unsigned int i;

    for (i = 0U; i < 5U; ++i) {
        const unsigned int mask = 255U ^ ((source[i] >> 8) & 255U);
        const unsigned int contribution = mask & value[i];
        x ^= contribution & ~x;
    }
    return x | ((unsigned int)(x == 0U) *
                (((0U - (u ^ (unsigned int)'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
