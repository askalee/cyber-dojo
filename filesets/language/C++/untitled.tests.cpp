#include "untitled.hpp"
#include <cassert>
#include <cstddef>

static void example()
{
    assert(hhg() == 6*9);
}

typedef void test();

static test * tests[] =
{
    example,
};

int main()
{
    for (size_t at = 0; at != sizeof tests / sizeof tests[0]; at++)
        tests[at]();
    return 0;
}

