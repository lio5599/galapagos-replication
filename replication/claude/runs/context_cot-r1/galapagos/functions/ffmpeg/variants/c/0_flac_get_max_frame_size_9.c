#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Every value is computed in unsigned arithmetic except the two divisions.
    // Each dividend is converted back to int before dividing, so /8 stays signed and truncating.
    // The low 32 bits of the products and sums match the int results wherever the reference is defined.
    unsigned int ub = (unsigned int)bps;
    unsigned int bits = (ch == 2) ? (2u * ub + 1u) : ((unsigned int)ch * ub);
    int hb = (int)(ub + 14u) / 8;
    int pb = (int)(bits * (unsigned int)blocksize + 7u) / 8;
    return (int)(16u + (unsigned int)ch * (unsigned int)hb + (unsigned int)pb + 2u);
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
