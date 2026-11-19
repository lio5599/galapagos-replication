#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Tests the non-stereo case first, reversing only the branch order.
    // Each selected expression and each addition matches the reference.
    // Zero and negative inputs retain the same truncation and grouping.
    int count;
    count = 16;
    count += ch * ((7 + bps + 7) / 8);
    if (ch != 2) {
        count += (ch * bps * blocksize + 7) / 8;
    } else {
        count += ((2 * bps + 1) * blocksize + 7) / 8;
    }
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
