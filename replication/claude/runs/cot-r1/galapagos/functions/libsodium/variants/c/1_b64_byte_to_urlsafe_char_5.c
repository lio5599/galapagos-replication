#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Approach: binary-search style nested ifs, splitting first at 52.
    // Below 52, split at 26 into uppercase or lowercase.
    // From 52 up, 52..61 are digits via x-4, 62 is '-', and 63 is '_'.
    // Anything at 64 or above returns 0, as the reference does for 64..255.
    if (x < 52) {
        if (x < 26) return (int) (x + 'A');
        return (int) (x + 71);
    }
    if (x < 62) return (int) (x - 4);
    if (x == 62) return '-';
    if (x == 63) return '_';
    return 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
