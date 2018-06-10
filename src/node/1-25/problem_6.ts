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

import { range, square, sum } from '../project_euler';

const end = 100;
const interval = range({ start: 1, end });
const theSumSquare = interval.map(square).reduce(sum, 0);
const theSquareSum = square(interval.reduce(sum, 0));

console.log(theSquareSum - theSumSquare);
