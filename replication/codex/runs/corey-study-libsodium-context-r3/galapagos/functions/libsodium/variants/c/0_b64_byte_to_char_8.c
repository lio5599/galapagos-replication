#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    unsigned int a = ((x - 26U) & 0xFF00U) >> 8;
    unsigned int b = ((x - 52U) & 0xFF00U) >> 8;
    unsigned int c = ((x - 62U) & 0xFF00U) >> 8;
    unsigned int d = ((0U - (x ^ 62U)) & 0xFF00U) >> 8;
    unsigned int e = ((0U - (x ^ 63U)) & 0xFF00U) >> 8;
    unsigned int letters = (a & (x + 'A')) |
                           ((a ^ 255U) & b & (x + ('a' - 26)));
    unsigned int digits = (b ^ 255U) & c & (x + ('0' - 52));
    unsigned int symbols = ((d ^ 255U) & '+') |
                           ((e ^ 255U) & '/');

    return letters | digits | symbols;
}


int main(){
    b64_byte_to_char(0);
}
