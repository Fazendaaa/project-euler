// 						Multiples of 3 and 5

// If we list all the natural numbers below 10 that are multiples of 3 or 5, we
// get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

// 						Answer: 233168
'use strict';

import { or, range } from '../project_euler';

const isMultiple = ({ value, numbers }: { value: number; numbers: Array<number> }): boolean => {
    return or(numbers.map(div => 0 === (value % div)));
};

const multiplesOf = ({ length, numbers }: { length: number; numbers: Array<number> }): Array<number> => {
    return range({ start: 1, end: length }).filter(value => isMultiple({ value, numbers }));
};

const limit = 1000;
console.log(multiplesOf({ length: (limit - 1), numbers: [3, 5] }).reduce((acc, cur) => acc + cur, 0));
