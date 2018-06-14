/*
                                10001st prime

    By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
    that the 6th prime is 13.

    What is the 10 001st prime number?

                                Answer: 104743
*/

#include <stdio.h>
#include "../lib/data/data.h"
#include "../lib/project_euler/project_euler.h"

static long int nthPrime (const long int nth) {
    long int counter = 0, number = 0;

    while (counter < nth) {
        number += 1;

        if (isIntPrime ((Data *) &number)) {
            counter += 1;
        }
    }

    return number;
}

int main (int argc, char ** argv) {
    const long int pos = 10001;

    printf ("%ld\n", nthPrime (pos));

    return 0;
}
