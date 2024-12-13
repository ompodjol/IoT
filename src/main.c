// main.c
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include "hello.h"

int main(void)
{
    print_hello();
    return 0;
}

/*
// Declare your test function
static void test_print_hello(void **state)
{
    // Your test code here
}

int main(void)
{
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_print_hello),
    };
    return cmocka_run_group_tests(tests, NULL, NULL);
}
*/
