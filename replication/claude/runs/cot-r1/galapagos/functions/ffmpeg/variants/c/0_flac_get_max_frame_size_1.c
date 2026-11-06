#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Approach: first choose the bits-per-sample-slot factor, then share one formula.
    // Factor is 2*bps+1 for stereo, otherwise ch*bps, exactly as in each branch.
    // factor*blocksize evaluates the same as the reference products in both cases.
    // Header, subframe header and CRC terms are added unchanged in the same order.
    int factor = (ch == 2) ? (2 * bps + 1) : (ch * bps);
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);
    count += (factor * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
