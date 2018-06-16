//                     Factorial digit sum

// n! means n × (n − 1) × ... × 3 × 2 × 1

// For  example,  10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,  and the sum of the
// digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

// Find the sum of the digits in the number 100!

//                         Answer: 648

'use strict';

import * as BigNumber from 'big-number';
import { range, sum } from '../project_euler';

const factorialDigits = (value: number) => {
    const bigFactorial = (acc: BigNumber, cur: number) => acc.multiply(cur);
    const result = range({ end: value }).reduce(bigFactorial, BigNumber(1));

    return result.number;
};

const digit = 100;

console.log(factorialDigits(digit).reduce(sum, 0));
