#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <inttypes.h>
#include "hello.h"

static void test_print_hello(void **state)
{
    (void)state; // Unused

    // Redirect stdout to a buffer
    FILE *original_stdout = stdout;
    char buffer[128];
    memset(buffer, 0, sizeof(buffer));
    stdout = fmemopen(buffer, sizeof(buffer), "w");

    // Call the function to test
    print_hello();

    // Restore stdout
    fclose(stdout);
    stdout = original_stdout;

    // Assert the output
    assert_string_equal(buffer, "Hello, World!\n");
}
