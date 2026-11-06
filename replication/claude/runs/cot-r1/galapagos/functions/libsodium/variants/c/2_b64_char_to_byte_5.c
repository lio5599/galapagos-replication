#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Handles out-of-byte values first: w >= 0xFF00 is the reference quirk (63, or 62 for low byte '/').
    // Any other w above 0xFF is invalid and returns 0xFF.
    // A chained conditional then yields a signed value, using -1 as the "invalid" sentinel.
    // -1 is converted to 0xFF. Valid values, including 0 for 'A', pass through unchanged.
    const unsigned int w = (unsigned int) c & 0xFFFFU;
    int v;
    if (w >= 0xFF00U) return 63U - (unsigned int) ((w & 0xFFU) == '/');
    if (w > 0xFFU) return 0xFFU;
    v = (w >= 'A' && w <= 'Z') ? (int) w - 65 :
        (w >= 'a' && w <= 'z') ? (int) w - 71 :
        (w >= '0' && w <= '9') ? (int) w + 4 :
        (w == '+') ? 62 : (w == '/') ? 63 : -1;
    return v < 0 ? 0xFFU : (unsigned int) v;
}


int main(){
    b64_char_to_byte(0);
}
