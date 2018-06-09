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

const smallestMultiple = (limit: number, acc: number, cur: number): number => {
    const upTo = Math.trunc(Math.log10(limit) / Math.log10(cur));

    return acc * Math.trunc(Math.pow(cur, upTo));
};

const limit = 20;
const primes = erastosthenesSieve(limit);
const curriedSmallestMultiple = ((acc: number, cur: number) => smallestMultiple(limit, acc, cur));
const result = primes.reduce(curriedSmallestMultiple, 1);

console.log(result);
