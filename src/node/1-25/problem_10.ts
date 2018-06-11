//                     Summation of primes

// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

// Find the sum of all the primes below two million.

//                     Answer: 142913828922

'use strict';

import { erastosthenesSieve, sum } from '../project_euler';

const limit = 2000000;
// Too Slow for a larger number.
console.log(erastosthenesSieve(limit).reduce(sum, 0));
