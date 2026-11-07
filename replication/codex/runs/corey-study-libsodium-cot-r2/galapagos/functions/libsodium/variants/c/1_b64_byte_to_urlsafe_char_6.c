#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Treat the masked candidates as sets of output bits and test each bit for membership.
    // A bit is emitted exactly when at least one reference term contains it.
    // No assumption about valid Base64 inputs or mutually exclusive masks is needed.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int terms[5];
    unsigned int result = 0U;
    unsigned int bit;
    unsigned int i;

    terms[0] = a & (x + 'A');
    terms[1] = (a ^ 255U) & b & (x + ('a' - 26));
    terms[2] = (b ^ 255U) & c & (x + ('0' - 52));
    terms[3] = ((((0U - (x ^ 62U)) >> 8) & 255U) ^ 255U) & '-';
    terms[4] = ((((0U - (x ^ 63U)) >> 8) & 255U) ^ 255U) & '_';

    for (bit = 1U; bit < 256U; bit <<= 1) {
        for (i = 0U; i < 5U; ++i) {
            if ((terms[i] & bit) != 0U) {
                result |= bit;
                break;
            }
        }
    }

    return (int)result;
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
