#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses a conditional expression for the channel-dependent contribution.
    // Only the selected expression is evaluated, as in the original branch.
    // Arithmetic grouping and signed rounding remain unchanged.
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);
    count += ch == 2
        ? ((2 * bps + 1) * blocksize + 7) / 8
        : (ch * bps * blocksize + 7) / 8;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
