#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Approach: inverted condition, testing ch != 2 first.
    // The non-stereo branch and stereo branch are swapped but otherwise identical.
    // 7+bps+7 is written as bps+14, which is the same int value.
    // Constants 16 and 2 are added as in the reference, so the total is unchanged.
    int count = 16;
    count += ch * ((bps + 14) / 8);
    if (ch != 2)
        count += (ch * bps * blocksize + 7) / 8;
    else
        count += ((2 * bps + 1) * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
