#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int header = ch * ((bps + 14) / 8);
    int payload;
    int count;

    if (ch != 2) {
        payload = (ch * bps * blocksize + 7) / 8;
    } else {
        payload = ((2 * bps + 1) * blocksize + 7) / 8;
    }

    count = 16 + header;
    count += payload;
    count += 2;

    return count;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
