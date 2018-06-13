/*
                            Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?

                            Answer: 6857
*/

#include <stdio.h>
#include "../lib/project_euler/project_euler.h"

static ListInt * primeFactors (const long int number) {
    ListInt * fact = factors (number), * primes = NULL;
    
    if (isNotNull (fact)) {
        primes = filterListInt (fact, isIntPrime);
        freeListInt (&fact);
    }

    return primes;
}

int main (int argc, char ** argv) {
    long int number = 600851475143, max = 0; 
    ListInt * primes = primeFactors (number);
    
    if (isNotNull (primes)) {
        max = maxListInt (primes);
        freeListInt (&primes);
    }

    printf ("%ld\n", max);

    return 0;
}
