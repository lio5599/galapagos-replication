#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // For unsigned values, division by 256 and remainder modulo 256 extract bits 8 through 15.
    // Replacing shifts and byte masks this way leaves the reference masks unchanged.
    // Unsigned subtraction preserves all defined reference results, including integer edge cases.
    const unsigned int u = (unsigned int)c;
    const unsigned int a =
        (255U ^ (((u - (unsigned int)'A') / 256U) % 256U)) &
        (255U ^ ((((unsigned int)'Z' - u) / 256U) % 256U));
    const unsigned int b =
        (255U ^ (((u - (unsigned int)'a') / 256U) % 256U)) &
        (255U ^ ((((unsigned int)'z' - u) / 256U) % 256U));
    const unsigned int d =
        (255U ^ (((u - (unsigned int)'0') / 256U) % 256U)) &
        (255U ^ ((((unsigned int)'9' - u) / 256U) % 256U));
    const unsigned int p = 255U ^ (((0U - (u ^ (unsigned int)'+')) / 256U) % 256U);
    const unsigned int s = 255U ^ (((0U - (u ^ (unsigned int)'/')) / 256U) % 256U);
    const unsigned int x = (a & (u - (unsigned int)'A')) |
                           (b & (u - (unsigned int)'a' + 26U)) |
                           (d & (u - (unsigned int)'0' + 52U)) |
                           (p & 62U) | (s & 63U);
    const unsigned int z = 255U ^ (((0U - x) / 256U) % 256U);
    const unsigned int n = ((0U - (u ^ (unsigned int)'A')) / 256U) % 256U;
    return x | (z & n);
}


int main(){
    b64_char_to_byte(0);
}
