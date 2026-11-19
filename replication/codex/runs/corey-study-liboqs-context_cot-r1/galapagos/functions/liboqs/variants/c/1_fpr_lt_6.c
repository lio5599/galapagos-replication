#include <stdint.h>

__attribute__((noinline))
int fpr_lt(uint64_t x, uint64_t y) {
    // For equal signs, encoding differences have magnitude below two to the 63.
    // The unsigned difference's top bit therefore indicates strict order.
    // Reverse subtraction for negatives; handle differing signs explicitly.
    // Unsigned subtraction is defined even at encoding boundaries.
    uint64_t sx = x >> 63;
    uint64_t sy = y >> 63;
    uint64_t forward = (x - y) >> 63;
    uint64_t reverse = (y - x) >> 63;
    uint64_t different = sx ^ sy;
    return (int)((different & sx)
               | ((different ^ 1) & ((sx & reverse)
                                   | ((sx ^ 1) & forward))));
}


int main(){
    fpr_lt(0,0);
}
