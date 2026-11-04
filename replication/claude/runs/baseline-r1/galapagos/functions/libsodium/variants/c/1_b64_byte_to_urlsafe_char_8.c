#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int lt26 = ((x - 26U) >> 8) & 0xFFU;
    unsigned int lt52 = ((x - 52U) >> 8) & 0xFFU;
    unsigned int lt62 = ((x - 62U) >> 8) & 0xFFU;
    unsigned int ge26 = 0xFFU - lt26;
    unsigned int ge52 = 0xFFU - lt52;
    unsigned int is62 = 0xFFU - (((0U - (x ^ 62U)) >> 8) & 0xFFU);
    unsigned int is63 = 0xFFU - (((0U - (x ^ 63U)) >> 8) & 0xFFU);
    return (int) ((lt26 & (x + 'A')) |
                  (ge26 & lt52 & (x + ('a' - 26))) |
                  (ge52 & lt62 & (x + ('0' - 52))) |
                  (is62 & '-') |
                  (is63 & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
