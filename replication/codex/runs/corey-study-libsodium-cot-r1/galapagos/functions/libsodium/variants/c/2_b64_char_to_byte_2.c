#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Subtracting an eight-bit value from 255 complements its eight bits.
    // This replaces mask XORs without changing any range or equality mask.
    // The original zero correction is retained, including for wider inputs.
    unsigned int u = (unsigned int)c;
    unsigned int a = 255U - ((((u - 'A') | ('Z' - u)) >> 8) & 255U);
    unsigned int b = 255U - ((((u - 'a') | ('z' - u)) >> 8) & 255U);
    unsigned int d = 255U - ((((u - '0') | ('9' - u)) >> 8) & 255U);
    unsigned int p = 255U - (((0U - (u ^ '+')) >> 8) & 255U);
    unsigned int q = 255U - (((0U - (u ^ '/')) >> 8) & 255U);
    unsigned int x = (a & (u - 'A')) | (b & (u - 'a' + 26U))
                   | (d & (u - '0' + 52U)) | (p & 62U) | (q & 63U);
    unsigned int zero = 255U - (((0U - x) >> 8) & 255U);
    return x | (zero & (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
