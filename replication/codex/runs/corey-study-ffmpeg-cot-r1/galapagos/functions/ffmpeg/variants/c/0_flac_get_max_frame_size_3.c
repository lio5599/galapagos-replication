#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Stores the selected payload byte count before adding it.
    // Only the selected branch is evaluated, avoiding extra overflow cases.
    // The original grouping and signed division cover edge cases identically.
    int count = 16;
    int payload;
    count += ch * ((7 + bps + 7) / 8);
    if (ch == 2) {
        payload = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        payload = (ch * bps * blocksize + 7) / 8;
    }
    count += payload;
    count += 2;
    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
