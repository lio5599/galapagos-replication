#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Store the five masks and candidates separately and OR their intersections.
    // This is the reference expression evaluated as a small dot product of bits.
    // Original masks, including the A exception, preserve non-byte edge cases.
    // Unsigned candidate arithmetic agrees wherever the reference is defined.
    const unsigned int u = (unsigned int)c;
    const unsigned int mask[5] = {
        (255U ^ (((u - 'A') >> 8) & 255U)) &
        (255U ^ ((('Z' - u) >> 8) & 255U)),
        (255U ^ (((u - 'a') >> 8) & 255U)) &
        (255U ^ ((('z' - u) >> 8) & 255U)),
        (255U ^ (((u - '0') >> 8) & 255U)) &
        (255U ^ ((('9' - u) >> 8) & 255U)),
        255U ^ (((0U - (u ^ '+')) >> 8) & 255U),
        255U ^ (((0U - (u ^ '/')) >> 8) & 255U)
    };
    const unsigned int value[5] = {
        u - 'A', u - 'a' + 26U, u - '0' + 52U, 62U, 63U
    };
    unsigned int x = 0U;
    unsigned int i;
    for (i = 0U; i < 5U; ++i)
        x |= mask[i] & value[i];
    return x |
        ((255U ^ (((0U - x) >> 8) & 255U)) &
         (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
