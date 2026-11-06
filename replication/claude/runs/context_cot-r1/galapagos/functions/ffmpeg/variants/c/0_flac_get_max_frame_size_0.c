#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Reference: upper bound in bytes of a FLAC frame (header, subframe headers, samples, CRC).
    // Approach: the same arithmetic split into named temporaries.
    // ch*bps*blocksize is evaluated as (ch*bps)*blocksize, as in the reference.
    // The signed /8 truncation and the order of the additions are unchanged.
    int hdr = (7 + bps + 7) / 8;
    int bits;
    int count = 16;
    count += ch * hdr;
    if (ch == 2)
        bits = 2 * bps + 1;
    else
        bits = ch * bps;
    count += (bits * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
