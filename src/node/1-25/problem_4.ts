//                         Largest palindrome product

// A  palindromic  number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91 × 99.

// Find the largest palindrome made from the product of two 3-digit numbers.

//                             Answer: 906609
'use strict';

import { isNumberPalindrome, range } from '../project_euler';

const palindromeProduct = (digits: number): Array<number> => {
    const upTo = digits - 1;
    const start = Math.pow(10, upTo);
    const end = Math.pow(10, (upTo + 1)) - 1;
    const interval = range({ start, end });
    const palindromes = [];

    for (let i = 0; i < interval.length; i += 1) {
        for (let j = i; j < interval.length; j += 1) {
            const product = interval[i] * interval[j];

            if (isNumberPalindrome(product)) {
                palindromes.push(product);
            }
        }
    }

    return palindromes;
};

console.log(Math.max(...palindromeProduct(3)));
