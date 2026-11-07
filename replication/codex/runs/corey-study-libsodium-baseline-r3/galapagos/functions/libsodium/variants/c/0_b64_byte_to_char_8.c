#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = ~((0U - (x ^ 62U)) >> 8) & 255U;
    unsigned int e = ~((0U - (x ^ 63U)) >> 8) & 255U;
    unsigned int upper = x + 'A';
    unsigned int lower = x + ('a' - 26);
    unsigned int digit = x + ('0' - 52);
    unsigned int result = 0U;
    unsigned int bit;

    for (bit = 1U; bit < 256U; bit <<= 1) {
        if (((a & bit) && (upper & bit)) ||
            ((~a & b & bit) && (lower & bit)) ||
            ((~b & c & bit) && (digit & bit)) ||
            ((d & bit) && ((unsigned int)'+' & bit)) ||
            ((e & bit) && ((unsigned int)'/' & bit)))
            result |= bit;
    }

    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
