/*
                            Smallest multiple

    2520  is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.

    What  is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?

                            Answer: 232792560

    Helped me out:
        *   http://www.mathblog.dk/project-euler-problem-5/
*/

#include <math.h>
#include <stdio.h>
#include "../lib/list/int/listint.h"
#include "../lib/project_euler/project_euler.h"

static long int magic (ListInt * list, const long limit) {
    long int upTo = 0, acc = 0, * element = NULL;

    if (0 == list->length) {
        return 1;
    }

    element = pop (list);
    upTo = log10 (limit) / log10 (castInt (element));
    acc = pow (castInt (element), upTo);

    return acc * magic (list, limit);
}

static long int smallestMultiple (const long int limit) {
    long int result = 0;
    ListInt * primes = eratosthenesSieve (limit);

    if (isNotNull (primes)) {
        result = magic (primes, limit);
        freeListInt (&primes);
    }

    return result;
}

int main (int argc, char ** argv) {
    const long int limit = 20;

    printf ("%ld\n", smallestMultiple (limit));

    return 0;
}
