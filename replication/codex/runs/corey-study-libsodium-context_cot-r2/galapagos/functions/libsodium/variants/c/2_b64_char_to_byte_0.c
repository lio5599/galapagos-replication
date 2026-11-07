#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Maps Base64 characters to 0–63 and other inputs by the reference's byte masks.
    // Each original mask is retained, including its behavior outside the byte range.
    // Unsigned arithmetic agrees wherever the reference's signed arithmetic is defined.
    const unsigned int u = (unsigned int)c;
    const unsigned int a = (((u - 'A') >> 8) & 255U) ^ 255U;
    const unsigned int b = ((('Z' - u) >> 8) & 255U) ^ 255U;
    const unsigned int d = (((u - 'a') >> 8) & 255U) ^ 255U;
    const unsigned int e = ((('z' - u) >> 8) & 255U) ^ 255U;
    const unsigned int f = (((u - '0') >> 8) & 255U) ^ 255U;
    const unsigned int g = ((('9' - u) >> 8) & 255U) ^ 255U;
    const unsigned int p = (((0U - (u ^ '+')) >> 8) & 255U) ^ 255U;
    const unsigned int q = (((0U - (u ^ '/')) >> 8) & 255U) ^ 255U;
    const unsigned int x = (a & b & (u - 'A')) |
                           (d & e & (u - 'a' + 26U)) |
                           (f & g & (u - '0' + 52U)) |
                           (p & 62U) | (q & 63U);
    return x | (((((0U - x) >> 8) & 255U) ^ 255U) &
                (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
