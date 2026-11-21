#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Selects the bits per sample group before performing common payload work.
    // Each branch preserves the original multiplication and addition grouping.
    // Common signed division and accumulation preserve defined edge cases.
    int count = 16;
    int bits;
    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2)
        bits = 2 * bps + 1;
    else
        bits = ch * bps;
    bits *= blocksize;
    bits += 7;
    bits /= 8;
    count += bits;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
