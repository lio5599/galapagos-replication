#include <stdint.h>

__attribute__((noinline))
static uint64_t BitDeinterleave(uint64_t Ai)
{
    // Identity function using a temporary variable to hold the result.
    // Since the reference always returns Ai unchanged, we copy Ai to a temp and return it.
    uint64_t result = Ai;
    return result;
}


int main(){
    BitDeinterleave(0);
}
