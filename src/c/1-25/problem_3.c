/*
                            Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?

                            Answer: 6857
*/

#include <stdio.h>
#include "../lib/project_euler/project_euler.h"

int main (int argc, char ** argv) {
    long int number = 600851475143; 
    ListInt * fact = factors (number), * primes = NULL;
    
    if (isNotNull (fact)) {
        primes = filterListInt (fact, isIntPrime);

        freeListInt (&fact);
    } if (isNotNull (primes)) {
        printf ("%ld\n", maxListInt (primes));

        freeListInt (&primes);
    }

    return 0;
}
