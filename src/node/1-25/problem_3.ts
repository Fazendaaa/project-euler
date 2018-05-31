//                         Largest prime factor

// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143?

//                         Answer: 6857
'use strict';

import { factors, isPrime } from '../project_euler';

const num = 600851475143;
console.log(Math.max(...factors(num).filter(isPrime)));
