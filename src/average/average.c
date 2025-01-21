#include "average.h"

float average(float arr[], unsigned int size)
{
    if (size == 0)
    {
        return 0.0; // Return 0 if the array is empty
    }
    float total = 0;
    for (unsigned int i = 0; i < size; i++)
    {
        total += arr[i];
    }

    return total / (float)size;
}
