//                             Non-abundant sums

// A  perfect  number  is  a number for which the sum of its proper divisors is
// exactly  equal to the number. For example, the sum of the proper divisors of
// 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

// A  number  n  is  called deficient if the sum of its proper divisors is less
// than n and it is called abundant if this sum exceeds n.

// As  12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
// number  that  can  be  written  as the sum of two abundant numbers is 24. By
// mathematical  analysis, it can be shown that all integers greater than 28123
// can be written as the sum of two abundant numbers. However, this upper limit
// cannot  be  reduced any further by analysis even though it is known that the
// greatest  number that cannot be expressed as the sum of two abundant numbers
// is less than this limit.

// Find the sum of all the positive integers which cannot be written as the sum
// of two abundant numbers.

//                             Answer: 4179871

'use strict';

import { factors, range, rangeDifference, sum } from '../project_euler';

const abundant = (limit: number): Array<number> => range({ end: limit }).filter(value => {
    return value < (factors(value).reduce(sum, 0) - value);
});

const abundantSum = (limit: number): Array<number> => {
    const areAbundant = abundant(limit);
    const sumOfAbundant = [];

    for (const first of areAbundant) {
        for (const second of areAbundant) {
            const sum = first + second;

            if (sum > limit) {
                break;
            }

            sumOfAbundant.push(sum);
        }
    }

    return sumOfAbundant;
};

const nonAbundant = (limit: number): Array<number> => rangeDifference({ end: limit }, abundantSum(limit));

const limit = 28123;

console.log(nonAbundant(limit).reduce(sum, 0));
