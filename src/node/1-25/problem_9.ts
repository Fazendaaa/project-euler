//                     Special Pythagorean triplet

// A  Pythagorean  triplet  is  a  set of three natural numbers, a < b < c, for
// which,

//                             a² + b² = c²

// For example, 3² + 4² = 9 + 16 = 25 = 5².

// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

//                     Answer = 31875000

'use strict';

import { flatten, mapAndFlatten, mult, not, range, square } from '../project_euler';

const isTriplet = (a: number, b: number, c: number): boolean => (square(a) + square(b) === square(c));

const isNotEmpty = <T>(value: Array<T>): boolean => (0 !== value.length);

const isSpecial = (a: number, b: number, c: number, total: number): Array<number> => {
    return isTriplet(a, b, c) && (a + b + c === total) ? [a, b, c] : [];
};

type Mapping = (value: number, index: number, array: Array<number>) => Array<number>;

// Need to improve this.
const handleList = (func: Mapping, array: Array<number>): Array<number> => {
    return array.map(func).filter(isNotEmpty).reduce(flatten, []);
};

const specialPythagoreanTriplet = (total: number) => {
    const interval = range({ end: Math.trunc(total / 2) });

    return handleList(((a, aIndex) => handleList(((b, bIndex) => handleList(((c: number) => isSpecial(a, b, c, total)),
    interval.slice(bIndex + 1))), interval.slice(aIndex + 1))), interval);
};

const total = 1000;
console.log(specialPythagoreanTriplet(total).reduce(mult, 1));
