// main.c
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include "hello.h"

/*int main(void)
{
    print_hello();
    return 0;
}
*/

static void test_print_hello(void **state)
{
    (void)state; // Unused
    memset(buffer, 0, sizeof(buffer));

    print_hello();

    fflush(stdout);
    assert_string_equal(buffer, "Hello, World!\n");
}
