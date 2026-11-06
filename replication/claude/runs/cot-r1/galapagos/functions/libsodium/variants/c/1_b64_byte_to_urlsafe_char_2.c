#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Approach: start from x+'A' and add range-dependent corrections.
    // Past 25 add 6 to reach 'a'. Past 51 subtract 75 to reach '0'.
    // At 62 subtract 13 more, so 62+65+6-75-13 = 45 = '-'.
    // At 63 add 49, so 63+65+6-75-13+49 = 95 = '_'.
    // Inputs of 64 or more return 0, matching the reference for 64..255.
    int c = (int) x + 'A';
    c += (x > 25) * 6;
    c -= (x > 51) * 75;
    c -= (x > 61) * 13;
    c += (x > 62) * 49;
    return x < 64 ? c : 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
