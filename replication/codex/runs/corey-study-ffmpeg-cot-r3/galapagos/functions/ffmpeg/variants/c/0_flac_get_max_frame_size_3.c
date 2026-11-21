#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Reverses the branch test without changing either payload formula.
    // The same additions occur in the same order.
    // Zero and negative inputs preserve truncation toward zero, with the
    // same result wherever the reference has defined behavior.
    int count;
    count = 16;
    count += ch * ((7 + bps + 7) / 8);

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
