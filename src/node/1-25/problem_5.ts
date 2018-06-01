//                         Smallest multiple

// 2520  is the smallest number that can be divided by each of the numbers from
// 1 to 10 without any remainder.

// What  is the smallest positive number that is evenly divisible by all of the
// numbers from 1 to 20?

//                         Answer: 232792560

// Helped me out:
//     *   http://www.mathblog.dk/project-euler-problem-5/

'use strict';

import { erastosthenesSieve } from '../project_euler';

const limit = 20;
const primes = erastosthenesSieve(limit);
let result = 1;

for (const prime of primes) {
    const upTo = Math.trunc(Math.log10(limit) / Math.log10(prime));
    result *= Math.trunc(Math.pow(prime, upTo));
}

console.log(result);
