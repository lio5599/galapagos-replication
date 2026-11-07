#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = ~((0U - (x ^ 62U)) >> 8);
    unsigned int e = ~((0U - (x ^ 63U)) >> 8);
    unsigned int result = 0U;
    unsigned int bit;

    for (bit = 1U; bit <= 0x80U; bit <<= 1) {
        if ((a & (x + 'A') & bit) ||
            (~a & b & (x + ('a' - 26)) & bit) ||
            (~b & c & (x + ('0' - 52)) & bit) ||
            (d & '-' & bit) ||
            (e & '_' & bit))
            result |= bit;
    }

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
