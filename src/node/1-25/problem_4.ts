//                         Largest palindrome product

// A  palindromic  number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.

// Find the largest palindrome made from the product of two 3-digit numbers.

//                             Answer: 906609

'use strict';

import { flatten, isNumberPalindrome, not, range } from '../project_euler';

const palindromeProduct = (digits: number): Array<number> => {
    const upTo = digits - 1;
    const interval = range({
        start: Math.pow(10, upTo),
        end: Math.pow(10, (upTo + 1)) - 1
    });

    return interval.map((first, index) =>
        interval.slice(index).map(second => first * second).filter(isNumberPalindrome)
    ).reduce(flatten, []);
};

console.log(Math.max(...palindromeProduct(3)));
