#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // The products and divisions are signed as in the reference, but the terms are summed as unsigned.
    // Unsigned addition wraps, so the low 32 bits match the reference whenever it has no overflow.
    // The two constants 16 and 2 are therefore merged into 18 safely.
    unsigned int u = 18u;
    int bits = (ch == 2) ? (2 * bps + 1) : (ch * bps);
    u += (unsigned int)(ch * ((7 + bps + 7) / 8));
    u += (unsigned int)((bits * blocksize + 7) / 8);
    return (int)u;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
