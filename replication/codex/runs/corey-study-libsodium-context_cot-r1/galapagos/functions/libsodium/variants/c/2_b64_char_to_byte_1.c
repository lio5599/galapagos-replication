#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // De Morgan's law merges each pair of range masks before the shift.
    // Logical shifts distribute over OR, so every extracted mask bit is unchanged.
    // All arithmetic is unsigned, retaining the reference's behavior outside character inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ~(((u - (unsigned int)'A') |
                              ((unsigned int)'Z' - u)) >> 8) & 255U;
    const unsigned int b = ~(((u - (unsigned int)'a') |
                              ((unsigned int)'z' - u)) >> 8) & 255U;
    const unsigned int d = ~(((u - (unsigned int)'0') |
                              ((unsigned int)'9' - u)) >> 8) & 255U;
    const unsigned int x =
        (a & (u - (unsigned int)'A')) |
        (b & (u - (unsigned int)'a' + 26U)) |
        (d & (u - (unsigned int)'0' + 52U)) |
        (~((0U - (u ^ (unsigned int)'+')) >> 8) & 62U) |
        (~((0U - (u ^ (unsigned int)'/')) >> 8) & 63U);
    return x | ((~((0U - x) >> 8) & 255U) &
                (((0U - (u ^ (unsigned int)'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
