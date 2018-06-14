/*
                        Sum square difference

    The sum of the squares of the first ten natural numbers is,

                    1² + 2² + ... + 10² = 385

    The square of the sum of the first ten natural numbers is,

                (1 + 2 + ... + 10)² = 55² = 3025

    Hence the difference between the sum of the squares of the first ten natural
    numbers and the square of the sum is 3025 − 385 = 2640.

    Find  the difference between the sum of the squares of the first one hundred
    natural numbers and the square of the sum.

    						Answer: 25164150
*/

#include <math.h>
#include <stdio.h>
#include "../lib/range/int/rangeint.h"

static long int toSquare (const long int acc, const long int cur) {
    return acc + pow (cur, 2);
}

static long int toSum (const long int acc, const long int cur) {
    return acc + cur;    
}

int main (int argc, char ** argv) {
    const long int limit = 100;
    RangeInt range;
    long int theSquareSum = 0, theSumSquare = 0;

    range.step = 1;
    range.start = 1;
    range.end = limit + 1;

    theSquareSum = reduceRangeInt (range, toSquare, theSquareSum);
    theSumSquare = reduceRangeInt (range, toSum, theSumSquare);
    theSumSquare = pow (theSumSquare, 2);

    printf ("%ld\n", theSumSquare - theSquareSum);

    return 0;
}
