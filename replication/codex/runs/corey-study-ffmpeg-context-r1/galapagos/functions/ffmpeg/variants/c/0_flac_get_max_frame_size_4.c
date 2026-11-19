#include <stdint.h>

__attribute__((noinline))
static int flac_get_max_frame_size(int blocksize, int ch, int bps)
{
    int count;
    int header;
    int payload;

    header = (7 + bps + 7) / 8;
    count = 16 + ch * header;
    if (ch == 2) {
        payload = ((2 * bps + 1) * blocksize + 7) / 8;
    } else {
        payload = (ch * bps * blocksize + 7) / 8;
    }
    count = count + payload;
    return count + 2;
}


int main(){
    flac_get_max_frame_size(0,0,0);
}
