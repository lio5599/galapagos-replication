#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int a = x - 26U;
    unsigned int b = x - 52U;
    unsigned int c = x - 62U;
    unsigned int d = 0U - (x ^ 62U);
    unsigned int e = 0U - (x ^ 63U);
    return (int) ((((a >> 8) & 0xFFU) & (x + 'A')) |
                  (((~a >> 8) & 0xFFU) & ((b >> 8) & 0xFFU) & (x + ('a' - 26))) |
                  (((~b >> 8) & 0xFFU) & ((c >> 8) & 0xFFU) & (x + ('0' - 52))) |
                  (((~d >> 8) & 0xFFU) & '-') |
                  (((~e >> 8) & 0xFFU) & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
