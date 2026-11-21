#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Uses explicit assignments instead of compound additions.
    // Each right-hand side performs exactly the corresponding original step.
    // No rounding or overflow assumptions are added, so zero and negative
    // cases agree wherever the reference has defined behavior.
    int count;
    count = 16;
    count = count + ch * ((7 + bps + 7) / 8);

    if (ch == 2)
        count = count + ((2 * bps + 1) * blocksize + 7) / 8;
    else
        count = count + (ch * bps * blocksize + 7) / 8;

    count = count + 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
