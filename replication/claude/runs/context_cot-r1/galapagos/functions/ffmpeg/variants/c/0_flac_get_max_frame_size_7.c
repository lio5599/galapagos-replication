#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Unsigned accumulation in a different order: the CRC (2), the sample bytes, then 16 and the header.
    // The signed products and divisions match the reference exactly.
    // Wrapping unsigned sums are equal modulo 2^32, so the final int matches.
    unsigned int acc = 2u;
    if (ch == 2)
        acc += (unsigned int)(((2 * bps + 1) * blocksize + 7) / 8);
    else
        acc += (unsigned int)((ch * bps * blocksize + 7) / 8);
    acc += 16u;
    acc += (unsigned int)(ch * ((7 + bps + 7) / 8));
    return (int)acc;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
