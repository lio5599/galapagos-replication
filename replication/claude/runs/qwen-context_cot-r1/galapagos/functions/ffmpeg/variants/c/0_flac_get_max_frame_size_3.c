#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses a single expression combining all terms.
    // The ternary operator selects the correct residual formula based on ch==2.
    // All divisions are ceiling divisions implemented as (x+7)/8.
    int count;
    count = 16 + ch * ((bps + 14) / 8) + 2;
    if (ch == 2) {
        count += ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        count += (ch * bps * blocksize + 7) / 8;
    }
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
