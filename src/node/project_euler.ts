'use strict';

import { Range } from './index';

export const range = ({ end, start = 1, step = 1 }: Range): Array<number> => {
    const length = ((end + 1) - start) / step;

    return Array.apply(null, { length: length.toFixed(5) }).map((cur: any, index: number) => (index * step) + start);
};

export const factors = (num: number): Array<number> => {
    const factorLimit = Math.floor(Math.sqrt(num)) + 1;
    const factors = [];

    for (let index = 1; index < factorLimit; index += 1) {
        if (0 === (num % index)) {
            const dividend = num / index;

            if (dividend !== index) {
                factors.push(dividend);
            }

            factors.push(index);
        }
    }

    return factors;
};

export const isPrime = (num: number): boolean => {
    const primeLimit = Math.sqrt(num) + 1;

    if (2 > num) {
        return false;
    }

    if (2 === num) {
        return true;
    }

    for (let iterator = 2; iterator < primeLimit; iterator += 1) {
        if (0 === num % iterator) {
            return false;
        }
    }

    return true;
}

export const isWordPalindrome = (str: string): boolean => {
    for (let iterator = 0; iterator < (str.length / 2); iterator += 1) {
        const first = str.charAt(iterator);
        const last = str.charAt(str.length - (iterator + 1));

        if (first !== last) {
            return false;
        }
    }

    return true;
};

export const isNumberPalindrome = (num: number): boolean => isWordPalindrome(num.toString());

export const erastosthenesSieve = (num: number): Array<number> => {
    const sieveLimit = Math.trunc(Math.sqrt(num)) + 1;
    const multiples: Array<number> = [];
    const primes: Array<number> = [];

    for (let iterator = 2; iterator < sieveLimit; iterator += 1) {
        for (let multiply = 2; multiply < num; multiply += 1) {
            const product = iterator * multiply;

            if (product > num) {
                break;
            }

            multiples.push(product);
        }
    }

    for (let iterator = 2; iterator < num; iterator += 1) {
        if (not(multiples.includes(iterator))) {
            primes.push(iterator);
        }
    }

    return primes;
};

export const zipWith = <T>(func: (a: T, b: T) => T, first: Array<T>, second: Array<T>): Array<T> => {
    const result: Array<T> = [];
    const minimum = Math.min(first.length, second.length);

    for (let index = 0; index < minimum; index += 1) {
        result.push(func(first[index], second[index]));
    }

    return result;
};

export const zipSetWith = <T>(func: (a: T, b: T) => T, first: Array<T>, second: Array<T>): Array<T> => {
    const result: Array<T> = [];

    for (let indexA = 0; indexA < first.length; indexA += 1) {
        for (let indexB = indexA; indexB < second.length; indexB += 1) {
            result.push(func(first[indexA], second[indexB]));
        }
    }

    return result;
};

export const mapAndFilter = <T>(map: Function, filter: Function, array: Array<T>): Array<T> => {
    const newArray: Array<T> = [];

    array.forEach(callbackFn => {
        const mapped = map(callbackFn);

        if (filter(mapped)) {
            newArray.push(mapped);
        }
    });

    return newArray;
};

export const mapAndFlatten = <T>(map: Function, array: Array<T>): Array<T> => {
    return array.reduce((acc, cur, curIndex, curArr) => acc.concat(map(cur, curIndex, curArr)), []);
};

export const unique = <T>(input: Array<T>): Array<T> => [...new Set(input)];

export const sum = (x: number, y: number): number => (x + y);

export const mult = (x: number, y: number): number => (x * y);

export const flatten = <T>(acc: Array<T>, cur: Array<T>): Array<T> => acc.concat(cur);

export const concatenate = <T>(acc: Array<T>, cur: T): Array<T> => acc.concat(cur);

export const square = (x: number) => Math.pow(x, 2);

export const not = (value: boolean): boolean => !value;

export const or = (arr: Array<boolean>): boolean => arr.reduce((acc, cur) => (false === acc) ? cur : true, false);

export const and = (arr: Array<boolean>): boolean => arr.reduce((acc, cur) => (true === acc) ? cur : false, true);

export const isOdd = (num: number): boolean => (0 !== num % 2);

export const isEven = (num: number): boolean => (0 === num % 2);

export const factorial = (num: number): number => range({ end: num }).reduce(mult, 1);
