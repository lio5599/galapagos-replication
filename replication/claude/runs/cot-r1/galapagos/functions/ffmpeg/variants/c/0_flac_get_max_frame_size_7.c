#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Approach: branch at the top and return a complete expression from each branch.
    // Both returns include 16 header bytes, ch subframe headers and 2 CRC bytes.
    // Only the residual term differs: 2*bps+1 bits for stereo, ch*bps otherwise.
    // Expressions are identical to the reference, so all edge cases behave the same.
    int sub = ch * ((7 + bps + 7) / 8);
    if (ch == 2)
        return 16 + sub + ((2 * bps + 1) * blocksize + 7) / 8 + 2;
    return 16 + sub + (ch * bps * blocksize + 7) / 8 + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
