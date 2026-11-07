#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Test whether each output bit is supplied by any of the five terms.
    // Logical tests apply to individual bits, not to whole partial masks.
    // Thus arbitrary unsigned inputs retain exactly the reference's bit behavior.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    unsigned int va = x + 'A';
    unsigned int vb = x + ('a' - 26);
    unsigned int vc = x + ('0' - 52);
    unsigned int result = 0U;
    unsigned int bit;

    for (bit = 1U; bit < 256U; bit <<= 1) {
        if (((a & bit) && (va & bit)) ||
            (!(a & bit) && (b & bit) && (vb & bit)) ||
            (!(b & bit) && (c & bit) && (vc & bit)) ||
            ((d & bit) && ((unsigned int)'+' & bit)) ||
            ((e & bit) && ((unsigned int)'/' & bit)))
            result |= bit;
    }
    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
