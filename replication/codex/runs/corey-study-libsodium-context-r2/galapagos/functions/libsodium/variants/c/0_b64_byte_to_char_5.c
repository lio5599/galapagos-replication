#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = (0U - (x ^ 62U)) >> 8;
    unsigned int e = (0U - (x ^ 63U)) >> 8;
    unsigned int upper = x + 'A';
    unsigned int lower = x + ('a' - 26);
    unsigned int digit = x + ('0' - 52);

    return ((upper ^ (upper & ~a)) |
            (lower ^ (lower & (a | ~b))) |
            (digit ^ (digit & (b | ~c))) |
            ((unsigned int)'+' ^ ((unsigned int)'+' & d)) |
            ((unsigned int)'/' ^ ((unsigned int)'/' & e))) & 255U;
}


int main(){
    b64_byte_to_char(0);
}
