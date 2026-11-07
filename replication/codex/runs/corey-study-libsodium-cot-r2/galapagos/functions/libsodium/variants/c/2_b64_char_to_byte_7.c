#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Use separate table-driven passes for alphabet ranges and punctuation.
    // Reversing evaluation order is harmless because bitwise OR is associative.
    // The exact masks are retained rather than assuming c is an ASCII byte.
    // The zero correction preserves A and all other reference-defined edge cases.
    const unsigned int u = (unsigned int)c;
    const unsigned int range[3][3] = {
        { 'A', 'Z', 0U }, { 'a', 'z', 26U }, { '0', '9', 52U }
    };
    const unsigned int symbol[2][2] = {
        { '+', 62U }, { '/', 63U }
    };
    unsigned int x = 0U;
    unsigned int i = 2U;
    while (i != 0U) {
        --i;
        x |= ((~(0U - (u ^ symbol[i][0])) >> 8) & 255U) &
             symbol[i][1];
    }
    i = 3U;
    while (i != 0U) {
        --i;
        x |= ((~((u - range[i][0]) | (range[i][1] - u)) >> 8) &
              255U) & (u - range[i][0] + range[i][2]);
    }
    return x |
        ((255U ^ (((0U - x) >> 8) & 255U)) &
         (((0U - (u ^ 'A')) >> 8) & 255U));
}


int main(){
    b64_char_to_byte(0);
}
