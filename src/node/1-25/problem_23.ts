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

import { factors, not, range, sum, unique, zipSetWith } from '../project_euler';

const isAbundant = (value: number): boolean => value < factors(value).reduce(sum, 0) - value;

const allAbundant = (limit: number): Array<number> => range({ end: limit }).filter(isAbundant);

const sumOfAbundant = (limit: number): Array<number> => {
    const areAbundant = allAbundant(limit);

    return unique(zipSetWith(sum, areAbundant, areAbundant)).filter(value => value < limit);
};

const nonAbundant = (limit: number): Array<number> => {
    const result = sumOfAbundant(limit);

    return range({ end: <number> result.pop() - 1 }).filter(value => not(result.includes(value)));
}

const limit = 28123;

console.log(nonAbundant(limit).reduce(sum, 0));
