//                     1000-digit Fibonacci number

// The Fibonacci sequence is defined by the recurrence relation:

//             Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

// Hence the first 12 terms will be:

//     F1 = 1
//     F2 = 1
//     F3 = 2
//     F4 = 3
//     F5 = 5
//     F6 = 8
//     F7 = 13
//     F8 = 21
//     F9 = 34
//     F10 = 55
//     F11 = 89
//     F12 = 144

// The 12th term, F12, is the first term to contain three digits.

// What  is  the  index  of the first term in the Fibonacci sequence to contain
// 1000 digits?

//                         Answer: 4782

'use strict';

import * as BigNumber from 'big-number';

// Decided to go without using array because Node says that I'm using too much memory, and I'm using Big-Number also.
const firstFibonacciDigits = (digits: number): { value: string; position: number } => {
    let first = new BigNumber(1);
    let second = new BigNumber(1);
    let third = new BigNumber(2);
    let position = 3;

    while (third.number.length < digits) {
        first = second;
        second = third;
        third = new BigNumber(0);
        third.plus(first).plus(second);
        position += 1;
    }

    return {
        value: third.number.reverse().map(String).join(''),
        position
    };
};

const digits = 1000;

console.log(firstFibonacciDigits(digits));
