/*
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
*/

#include <stdlib.h>
#include <stdio.h>
#include "../lib/data/data.h"
#include "../lib/list/int/listint.h"
#include "../lib/range/int/rangeint.h"

Boolean isDivisibleBy (const long int value, const long int by) {
    return (0 == value % by);
}

Boolean filter (const long int value) {
    return isDivisibleBy (value, 3) || isDivisibleBy (value, 5);
}

Data * sumInt (Data * acc, const Data * cur) {
    return (Data *) (castInt (acc) += castInt (cur));
}

int main (int argc, char ** argv) {
    RangeInt range;
    ListInt * list = NULL;
    long int result = 0;

    range.start = 1;
    range.step = 1;
    range.end = 1000;

    list = filterRangeInt (range, filter);
    result = reduceListInt (list, sumInt, result);

    printf ("%ld\n", result);

    freeListInt (&list);

    return 0;
}
