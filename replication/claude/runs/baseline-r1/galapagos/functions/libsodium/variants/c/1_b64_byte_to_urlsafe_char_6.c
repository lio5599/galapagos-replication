#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int n62 = x ^ 62U;
    unsigned int n63 = x ^ 63U;
    unsigned int lt26 = ((x - 26U) >> 8) & 0xFFU;
    unsigned int lt52 = ((x - 52U) >> 8) & 0xFFU;
    unsigned int lt62 = ((x - 62U) >> 8) & 0xFFU;
    unsigned int is62 = ((-n62 >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int is63 = ((-n63 >> 8) & 0xFFU) ^ 0xFFU;
    unsigned int upper = lt26 & (x + 'A');
    unsigned int lower = ~lt26 & lt52 & 0xFFU & (x + ('a' - 26));
    unsigned int digit = ~lt52 & lt62 & 0xFFU & (x + ('0' - 52));
    return (int) (upper | lower | digit | (is62 & '-') | (is63 & '_'));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
