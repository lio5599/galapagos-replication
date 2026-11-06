#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Approach: walk the segments, subtracting each length from the remainder.
    // The segments are 26 'A', 26 'a', 10 '0', 1 '-' and 1 '_'.
    // When the remainder fits a segment, return that segment's base plus it.
    // This gives the same char as the reference for every x in 0..63.
    // If no segment matches, x >= 64 and the result is 0, as in the reference.
    static const unsigned char len[5] = { 26, 26, 10, 1, 1 };
    static const unsigned char base[5] = { 'A', 'a', '0', '-', '_' };
    unsigned int r = x, i;
    for (i = 0; i < 5; i++) {
        if (r < len[i]) return (int) (base[i] + r);
        r -= len[i];
    }
    return 0;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
