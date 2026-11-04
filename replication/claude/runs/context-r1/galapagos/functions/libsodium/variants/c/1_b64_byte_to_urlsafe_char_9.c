#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int s26 = x - 26U;
    unsigned int s52 = s26 - 26U;
    unsigned int s62 = s52 - 10U;
    unsigned int y62 = x ^ 62U;
    unsigned int y63 = y62 ^ 1U;
    unsigned int a = (s26 >> 8) & 0xFFU;
    unsigned int b = (s52 >> 8) & 0xFFU;
    unsigned int c = (s62 >> 8) & 0xFFU;
    unsigned int d = ((y62 - 1U) >> 8) & 0xFFU;
    unsigned int e = ((y63 - 1U) >> 8) & 0xFFU;

    return (int) ((d & 45U) |
                  (a & (x + 65U)) |
                  (e & 95U) |
                  (b & (a ^ 0xFFU) & (x + 71U)) |
                  (c & (b ^ 0xFFU) & (x - 4U)));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
