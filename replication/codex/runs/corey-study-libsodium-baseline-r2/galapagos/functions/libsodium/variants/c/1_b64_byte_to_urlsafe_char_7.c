#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int terms[5] = {
        a & (x + 'A'),
        ~a & b & (x + ('a' - 26)),
        ~b & ((x - 62U) >> 8) & (x + ('0' - 52)),
        ~((0U - (x ^ 62U)) >> 8) & '-',
        ~((0U - (x ^ 63U)) >> 8) & '_'
    };
    unsigned int result = 0U;
    unsigned int i = 5U;

    while (i != 0U) {
        --i;
        result ^= terms[i] & ~result;
    }

    return (int)(result & 0xFFU);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
