//                     Sum square difference

// The sum of the squares of the first ten natural numbers is,

//                 1² + 2² + ... + 10² = 385

// The square of the sum of the first ten natural numbers is,

//             (1 + 2 + ... + 10)² = 55² = 3025

// Hence the difference between the sum of the squares of the first ten natural
// numbers and the square of the sum is 3025 − 385 = 2640.

// Find  the difference between the sum of the squares of the first one hundred
// natural numbers and the square of the sum.

//                          Answer: 25164150

'use strict';

import { range, sum } from '../project_euler';

const interval = range({
    start: 1,
    end: 100
});
const theSum = interval.map(elem => Math.pow(elem, 2)).reduce(sum, 0);
const theSquare = Math.pow(interval.reduce(sum, 0), 2);

console.log(theSquare - theSum);
