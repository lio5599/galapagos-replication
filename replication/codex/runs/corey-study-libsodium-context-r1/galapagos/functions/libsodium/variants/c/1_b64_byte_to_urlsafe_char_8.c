#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = ((x - 26U) >> 8) & 0xFFU;
    unsigned int b = ((x - 52U) >> 8) & 0xFFU;
    unsigned int c = ((x - 62U) >> 8) & 0xFFU;
    unsigned int d = ((0U - (x ^ 62U)) >> 8) & 0xFFU;
    unsigned int e = ((0U - (x ^ 63U)) >> 8) & 0xFFU;
    unsigned int upper = (x + 'A') & 0xFFU;
    unsigned int lower = (x + ('a' - 26)) & 0xFFU;
    unsigned int digit = (x + ('0' - 52)) & 0xFFU;
    unsigned int dash = ((unsigned int) '-') & 0xFFU;
    unsigned int underscore = ((unsigned int) '_') & 0xFFU;

    return (upper & a) |
           (lower & b & ~a) |
           (digit & c & ~b) |
           (dash & ~d) |
           (underscore & ~e);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
