#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Extract rejection bits, then clear them from each candidate value.
    // Each candidate is restricted to the same low byte as in the reference.
    // The final rejection mask is preserved even for non-character integer inputs.
    const unsigned int u = (unsigned int)c;
    const unsigned int ra = (((u - (unsigned int)'A') |
                              ((unsigned int)'Z' - u)) >> 8) & 255U;
    const unsigned int rb = (((u - (unsigned int)'a') |
                              ((unsigned int)'z' - u)) >> 8) & 255U;
    const unsigned int rd = (((u - (unsigned int)'0') |
                              ((unsigned int)'9' - u)) >> 8) & 255U;
    const unsigned int rp = ((0U - (u ^ (unsigned int)'+')) >> 8) & 255U;
    const unsigned int rs = ((0U - (u ^ (unsigned int)'/')) >> 8) & 255U;
    const unsigned int x = ((u - (unsigned int)'A') & 255U & ~ra) |
                           ((u - (unsigned int)'a' + 26U) & 255U & ~rb) |
                           ((u - (unsigned int)'0' + 52U) & 255U & ~rd) |
                           (62U & ~rp) | (63U & ~rs);
    const unsigned int rz = ((0U - x) >> 8) & 255U;
    const unsigned int rn = ((0U - (u ^ (unsigned int)'A')) >> 8) & 255U;
    return x | (rn & ~rz);
}


int main(){
    b64_char_to_byte(0);
}
