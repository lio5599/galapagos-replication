#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // The reference maps Base64 characters to sextets using byte-wide masks.
    // Preserve its exact arithmetic masks, including for non-character inputs.
    // Unsigned subtraction matches each signed term wherever the reference is defined.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = ((((u - 'A') >> 8) & 0xFFU) ^ 0xFFU)
                         & (((('Z' - u) >> 8) & 0xFFU) ^ 0xFFU);
    const unsigned int b = ((((u - 'a') >> 8) & 0xFFU) ^ 0xFFU)
                         & (((('z' - u) >> 8) & 0xFFU) ^ 0xFFU);
    const unsigned int d = ((((u - '0') >> 8) & 0xFFU) ^ 0xFFU)
                         & (((('9' - u) >> 8) & 0xFFU) ^ 0xFFU);
    const unsigned int p = (((0U - (u ^ '+')) >> 8) & 0xFFU) ^ 0xFFU;
    const unsigned int q = (((0U - (u ^ '/')) >> 8) & 0xFFU) ^ 0xFFU;
    const unsigned int x = (a & (u - 'A'))
                         | (b & (u - ('a' - 26)))
                         | (d & (u - ('0' - 52)))
                         | (p & 62U) | (q & 63U);
    return x | (((((0U - x) >> 8) & 0xFFU) ^ 0xFFU)
              & (((0U - (u ^ 'A')) >> 8) & 0xFFU));
}


int main(){
    b64_char_to_byte(0);
}
