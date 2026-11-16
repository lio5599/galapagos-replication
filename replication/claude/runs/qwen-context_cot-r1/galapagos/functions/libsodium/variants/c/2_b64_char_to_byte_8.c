#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
// Implements logic using a helper array for offsets and ranges.
// Iterates through ranges to find match. Returns 0 if no match.
// Equivalent as it checks all valid base64 character sets.
{
    // Ranges: start, end, offset
    struct { char start; char end; unsigned int offset; } ranges[] = {
        {'A', 'Z', 0},
        {'a', 'z', 26},
        {'0', '9', 52},
        {'+', '+', 62},
        {'/', '/', 63}
    };
    int i;
    for (i = 0; i < 5; i++) {
        if (c >= ranges[i].start && c <= ranges[i].end) {
            return (unsigned int)(c - ranges[i].start + ranges[i].offset);
        }
    }
    return 0;
}


int main(){
    b64_char_to_byte(0);
}
