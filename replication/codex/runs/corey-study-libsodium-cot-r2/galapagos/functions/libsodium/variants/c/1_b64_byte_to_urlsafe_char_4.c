#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Construct the result one bit at a time from the five effective masks.
    // Each bit is the OR of the same five mask-and-value bits used by the reference.
    // Examining all eight output bits also preserves partially set masks on unusual inputs.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = (((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U;
    unsigned int e = (((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U;
    unsigned int p = x + 'A';
    unsigned int q = x + ('a' - 26);
    unsigned int r = x + ('0' - 52);
    unsigned int result = 0U;
    unsigned int i;

    for (i = 0U; i < 8U; ++i) {
        unsigned int bit = ((a >> i) & (p >> i)) |
                           (((a ^ 255U) >> i) & (b >> i) & (q >> i)) |
                           (((b ^ 255U) >> i) & (c >> i) & (r >> i)) |
                           ((d >> i) & ((unsigned int)'-' >> i)) |
                           ((e >> i) & ((unsigned int)'_' >> i));
        result |= (bit & 1U) << i;
    }

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
