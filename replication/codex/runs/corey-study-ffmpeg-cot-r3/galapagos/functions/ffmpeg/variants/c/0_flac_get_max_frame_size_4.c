#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    // Returns directly from the stereo branch after adding its payload.
    // Both paths add the final two bytes after the payload, as before.
    // Unchanged arithmetic preserves zero and negative cases whenever
    // the reference arithmetic is defined.
    int count = 16;
    count += ch * ((7 + bps + 7) / 8);

    if (ch == 2) {
        count += ((2 * bps + 1) * blocksize + 7) / 8;
        return count + 2;
    }

    count += (ch * bps * blocksize + 7) / 8;
    return count + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
