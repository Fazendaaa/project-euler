//                             Power digit sum

// 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

// What is the sum of the digits of the number 2**1000?

// 							Answer: 1366

'use strict';

import * as BigNumber from 'big-number';
import { sum } from '../project_euler';

const powerDigit = (upTo: number): Array<number> => BigNumber(2).power(upTo).number;

const upTo = 1000;
console.log(powerDigit(upTo).reduce(sum, 0));
