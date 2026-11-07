#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_char(unsigned int x)
{
    // Compute the result as two independent four-bit slices.
    // Bitwise gates do not carry between slices, so recombining reproduces OR.
    // Slice masks retain partial-mask behavior for inputs outside 0..63.
    unsigned int a = (x - 26U) >> 8;
    unsigned int b = (x - 52U) >> 8;
    unsigned int c = (x - 62U) >> 8;
    unsigned int d = ~((0U - (x ^ 62U)) >> 8);
    unsigned int e = ~((0U - (x ^ 63U)) >> 8);
    unsigned int va = x + 'A';
    unsigned int vb = x + ('a' - 26);
    unsigned int vc = x + ('0' - 52);
    unsigned int result = 0U;
    unsigned int shift;

    for (shift = 0U; shift < 8U; shift += 4U) {
        unsigned int ma = (a >> shift) & 15U;
        unsigned int mb = (b >> shift) & 15U;
        unsigned int mc = (c >> shift) & 15U;
        unsigned int md = (d >> shift) & 15U;
        unsigned int me = (e >> shift) & 15U;
        unsigned int part = (ma & (va >> shift)) |
                            ((ma ^ 15U) & mb & (vb >> shift)) |
                            ((mb ^ 15U) & mc & (vc >> shift)) |
                            (md & ((unsigned int)'+' >> shift)) |
                            (me & ((unsigned int)'/' >> shift));
        result |= part << shift;
    }
    return (int)result;
}


int main(){
    b64_byte_to_char(0);
}
