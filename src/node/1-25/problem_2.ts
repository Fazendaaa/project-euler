// 						Even Fibonacci numbers

// Each  new term in the Fibonacci sequence is generated by adding the previous
// two terms. By starting with 1 and 2, the first 10 terms will be:

// 				1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

// By  considering  the  terms  in  the  Fibonacci sequence whose values do not
// exceed four million, find the sum of the even-valued terms.

// 							Answer: 4613732
'use strict';

import { isEven, sum } from '../project_euler';

const fibonacciLimit = (limit: number): Array<number> => {
    const sequence = [1, 2];
    let nth = 3;

    while (nth < limit) {
        sequence.push(nth);

        const penultimate = sequence[sequence.length - 1];
        const antepenult = sequence[sequence.length - 2];

        nth = penultimate + antepenult;
    }

    return sequence;
};

const limit = 4000000;
console.log(fibonacciLimit(limit).filter(isEven).reduce(sum, 0));
