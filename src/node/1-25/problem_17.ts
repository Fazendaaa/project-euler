//                     Number letter counts

// If the numbers 1 to 5 are written out in words: one, two, three, four, five,
// then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

// If  all the numbers from 1 to 1000 (one thousand) inclusive were written out
// in words, how many letters would be used?

// NOTE:  Do  not  count spaces or hyphens. For example, 342 (three hundred and
// forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
// letters.  The  use  of  "and" when writing out numbers is in compliance with
// British usage.

//                         Answer: 21124

'use strict';

import * as wn from 'written-number';
import { range, sum } from '../project_euler';

const letterCounts = (limit: number): Array<number> => range({ end: limit }).map(num => wn(num).replace(/\s{1}|\-/gm, '').length);

const limit = 1000;
console.log(letterCounts(limit).reduce(sum, 0));
