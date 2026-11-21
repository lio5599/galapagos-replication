#include <stdint.h>

__attribute__((noinline))
static uint64_t icbrt64(uint64_t x)
{
    // Enumerate consecutive cubes using their finite differences.
    // cube equals r cubed, and delta equals the next cube minus this cube.
    // Testing x minus cube avoids overflowing when considering the next cube.
    // The root cap prevents an unrepresentable cube; zero needs no iteration.
    uint64_t r = 0;
    uint64_t cube = 0;
    uint64_t delta = 1;

    while (r < 2642245 && x - cube >= delta) {
        cube += delta;
        ++r;
        delta += 6 * r;
    }
    return r << 12;
}


int main(){
    icbrt64(0);
}
