#include "CppUTest/CommandLineTestRunner.h"

int main(int ac, char **av)
{
    // Run all tests and return the result. 0 indicates success. 1 indicates failure. 2 indicates inconclusive. 3 indicates timeout. 4 indicates memory leak. 5 indicates no tests found. 6 indicates unrecognized command line option. 7 indicates invalid test case name. 8 indicates test case name too long. 9 indicates invalid test case file name. 10 indicates invalid test case file format. 11 indicates invalid test case file location. 12 indicates invalid test case filter. 13 indicates invalid test case filter pattern. 14 indicates invalid test case filter group. 15 indicates invalid test case filter group pattern. 16 indicates invalid test case filter group operator. 17 indicates invalid test case filter group separator. 18 indicates invalid test case filter group conjunction. 19 indicates invalid test case filter group disjunction. 20
    return CommandLineTestRunner::RunAllTests(ac, av);
}
