#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include <stdio.h>
#include <string.h>
#include "hello.h"

static char buffer[256];
static FILE *orig_stdout;

static int setup(void **state)
{
    (void)state; // Unused
    orig_stdout = stdout;
    fflush(stdout);
    stdout = fmemopen(buffer, sizeof(buffer), "w");
    if (stdout == NULL)
    {
        return -1;
    }
    return 0;
}

static int teardown(void **state)
{
    (void)state; // Unused
    fflush(stdout);
    stdout = orig_stdout;
    return 0;
}

static void test_print_hello(void **state)
{
    (void)state; // Unused
    memset(buffer, 0, sizeof(buffer));

    print_hello();

    fflush(stdout);
    assert_string_equal(buffer, "Hello, World!\n");
}

int main(void)
{
    const struct CMUnitTest tests[] = {
        cmocka_unit_test_setup_teardown(test_hello, setup, teardown),
    };

    return cmocka_run_group_tests(tests, NULL, NULL);
}
