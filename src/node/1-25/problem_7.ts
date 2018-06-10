//                             10001st prime

// By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
// that the 6th prime is 13.
// What is the 10 001st prime number?

//                          Answer: 104743

'use strict';

import { isPrime } from '../project_euler';

const nthPrime = (nth: number): number => {
    let iterator = 0;
    let counter = 0;

    while (counter < nth) {
        iterator += 1;
        counter += isPrime(iterator) ? 1 : 0;
    }

    return iterator;
};

const nth = 10001;
console.log(nthPrime(nth));
