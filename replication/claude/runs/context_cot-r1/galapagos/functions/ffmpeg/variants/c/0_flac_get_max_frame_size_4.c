#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // 2*bps is written as bps+bps, which has the same value and the same overflow condition.
    // The branch is inverted (ch != 2 is tested first), with the same paths.
    // The order of the additions and the signed truncating divisions are unchanged.
    int count = 16;
    count += ch * ((bps + 7 + 7) / 8);
    if (ch != 2)
        count += (ch * bps * blocksize + 7) / 8;
    else
        count += ((bps + bps + 1) * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
