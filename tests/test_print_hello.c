#include <stdio.h>
#include <string.h>
#include <cmocka.h>
#include "hello.h"

static void test_print_hello(void **state)
{
    (void)state; // Unused parameter

    // Redirect stdout to a temporary file
    FILE *temp_file = tmpfile();
    if (temp_file == NULL)
    {
        fail_msg("Failed to create temporary file");
    }

    // Save original stdout
    int original_stdout_fd = dup(fileno(stdout));
    if (original_stdout_fd == -1)
    {
        fclose(temp_file);
        fail_msg("Failed to duplicate stdout file descriptor");
    }

    // Redirect stdout to temp_file
    if (dup2(fileno(temp_file), fileno(stdout)) == -1)
    {
        fclose(temp_file);
        close(original_stdout_fd);
        fail_msg("Failed to redirect stdout to temporary file");
    }

    // Call the function that prints to stdout
    print_hello();

    // Flush stdout to ensure all output is written
    fflush(stdout);

    // Rewind the temporary file to read its content
    rewind(temp_file);

    // Read the output
    char buffer[256];
    if (fgets(buffer, sizeof(buffer), temp_file) == NULL)
    {
        fclose(temp_file);
        close(original_stdout_fd);
        fail_msg("Failed to read from temporary file");
    }

    // Restore original stdout
    if (dup2(original_stdout_fd, fileno(stdout)) == -1)
    {
        fclose(temp_file);
        close(original_stdout_fd);
        fail_msg("Failed to restore original stdout");
    }
    close(original_stdout_fd);
    fclose(temp_file);

    // Verify the output
    assert_string_equal(buffer, "Hello, World!\n");
}
