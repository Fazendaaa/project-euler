/*
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
*/

#include <stdlib.h>
#include <stdio.h>
#include "../project_euler.h"

static unsigned long int * __multiplesOf (unsigned long int * numbers, unsigned long int limit) {
    Interval options;

    options.start = 0;
    options.end = limit;
    options.step = 1;

    printf("Options\nStart: %d\tStep: %d\t\tEnd: %d\n", options.start, options.step, options.end);

    return NULL;
}

static unsigned long int * multiplesOf (unsigned long int * numbers, unsigned long int limit) {
    if (NULL == numbers || 0 > limit) {
        return NULL;
    }

    return __multiplesOf(numbers, limit);
}

int main (int argc, char ** argv) {
    const unsigned long int limit = 10, length = 2;
    unsigned long int result = 0;
    unsigned long int *numbers = malloc(sizeof(long int) * length), *multiples = NULL;
    
    if (NULL != numbers) {
        numbers[0] = 3;
        numbers[0] = 5;

        multiples = multiplesOf(numbers, limit);
    } if (NULL != multiples) {
        result = reduce(multiples, );

        free(numbers);
        free(multiples);
    }

    return 0;
}
