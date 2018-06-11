//                     Longest Collatz sequence

// The  following  iterative  sequence  is  defined  for  the  set  of positive
// integers:

//                         n → n/2 (n is even)
//                         n → 3n + 1 (n is odd)

// Using  the  rule  above  and  starting  with  13,  we generate the following
// sequence:

//             13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

// It  can  be  seen  that  this  sequence  (starting at 13 and finishing at 1)
// contains 10 terms. Although it has not been proved yet (Collatz Problem), it
// is thought that all starting numbers finish at 1.

// Which starting number, under one million, produces the longest chain?

// NOTE: Once the chain starts the terms are allowed to go above one million.

//                             Answer: 837799

'use strict';

import { isEven, range } from '../project_euler';

const collatzSequence = (n: number): Array<number> => {
    if (1 === n) {
        return [1];
    }

    return isEven(n) ?
        [n].concat(collatzSequence(n / 2)) :
        [n].concat(collatzSequence((3 * n) + 1));
};

interface CollatzSize {
    start: number;
    size: number
}

const sequencesSizes = (limit: number): Array<CollatzSize> => {
    const sequences: Array<CollatzSize> = [];

    for (let start = 1; start < limit; start += 1) {
        sequences.push({ start, size: collatzSequence(start).length });
    }

    return sequences;
};

const limit = 1000000;
const largest = <CollatzSize> sequencesSizes(limit).sort((a, b) => a.size - b.size).pop();

console.log(largest.start);
