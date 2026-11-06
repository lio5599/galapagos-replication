#include <stdint.h>

__attribute__((noinline))
static unsigned int b64_char_to_byte(int c)
{
    // Branchless: each class gets an all-ones or all-zero mask from 0U - (comparison result).
    // The masked values are OR-ed together; the classes are disjoint, so at most one mask is set.
    // The 0xFF fallback is applied only when no class matched, so 'A' still correctly yields 0.
    // The quirk class w >= 0xFF00 yields 63, minus 1 when w == 0xFF2F, matching the reference.
    const unsigned int w = (unsigned int) c & 0xFFFFU;
    const unsigned int up = 0U - (unsigned int) (w - 'A' < 26U);
    const unsigned int lo = 0U - (unsigned int) (w - 'a' < 26U);
    const unsigned int dg = 0U - (unsigned int) (w - '0' < 10U);
    const unsigned int pl = 0U - (unsigned int) (w == '+');
    const unsigned int sl = 0U - (unsigned int) (w == '/');
    const unsigned int hi = 0U - (unsigned int) (w >= 0xFF00U);
    const unsigned int x = (up & (w - 65U)) | (lo & (w - 71U)) | (dg & (w + 4U)) | (pl & 62U) | (sl & 63U) |
                           (hi & (63U ^ (unsigned int) (w == 0xFF2FU)));
    return x | (~(up | lo | dg | pl | sl | hi) & 0xFFU);
}


int main(){
    b64_char_to_byte(0);
}
