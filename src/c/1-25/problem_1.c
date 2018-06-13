/*
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
*/

#include <stdio.h>
#include "../lib/data/data.h"
#include "../lib/list/int/listint.h"
#include "../lib/range/int/rangeint.h"
#include "../lib/project_euler/project_euler.h"

static Boolean isDivisibleBy (const long int value, const long int by) {
    return (0 == value % by);
}

static Boolean divisible (const long int value) {
    return isDivisibleBy (value, 3) || isDivisibleBy (value, 5);
}

static ListInt * multiplesBellow (const long int limit) {
    RangeInt range;

    range.start = 1;
    range.step = 1;
    range.end = limit;

    return filterRangeInt (range, divisible);
}

int main (int argc, char ** argv) {
    long int limit = 1000, result = 0;
    ListInt * list = multiplesBellow (limit);

    if (isNotNull (list)) {
        result = reduceListInt (list, sumInt, result);
        freeListInt (&list);
    }

    printf ("%ld\n", result);

    return 0;
}
