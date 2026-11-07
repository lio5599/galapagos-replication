#include <stdint.h>

__attribute__((noinline))
static int b64_byte_to_urlsafe_char(unsigned int x)
{
    // Remove unwanted mask bits with v XOR the intersection of v and the unwanted bits.
    // Each v is eight-bit, making this identical to the reference's complemented gates for all inputs.
    unsigned int a = ((x - 26U) >> 8) & 255U;
    unsigned int b = ((x - 52U) >> 8) & 255U;
    unsigned int c = ((x - 62U) >> 8) & 255U;
    unsigned int d = ((0U - (x ^ 62U)) >> 8) & 255U;
    unsigned int e = ((0U - (x ^ 63U)) >> 8) & 255U;
    unsigned int q = b & (x + ('a' - 26));
    unsigned int r = c & (x + ('0' - 52));
    unsigned int s = ((unsigned int) '-') & 255U;
    unsigned int t = ((unsigned int) '_') & 255U;
    return (a & (x + 'A')) |
           (q ^ (a & q)) |
           (r ^ (b & r)) |
           (s ^ (d & s)) |
           (t ^ (e & t));
}


int main(){
    b64_byte_to_urlsafe_char(0);
}
