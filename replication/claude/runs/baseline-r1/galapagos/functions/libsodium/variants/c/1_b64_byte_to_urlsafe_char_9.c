#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    unsigned int alpha_upper, alpha_lower, digits, dash, underscore;
    unsigned int k26 = (x - 26U) >> 8;
    unsigned int k52 = (x - 52U) >> 8;
    unsigned int k62 = (x - 62U) >> 8;

    alpha_upper = (k26 & 0xFFU) & (x + 'A');
    alpha_lower = (~k26 & 0xFFU) & (k52 & 0xFFU) & (x + ('a' - 26));
    digits = (~k52 & 0xFFU) & (k62 & 0xFFU) & (x + ('0' - 52));
    dash = (~((0U - (x ^ 62U)) >> 8) & 0xFFU) & '-';
    underscore = (~((0U - (x ^ 63U)) >> 8) & 0xFFU) & '_';

    return (int) (alpha_upper | alpha_lower | digits | dash | underscore);
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
