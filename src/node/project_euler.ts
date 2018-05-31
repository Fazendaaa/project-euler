'use strict';

export const range = ({ start, end, step }: {start: number; end: number; step?: number}): Array<number> => {
    const length = (end + 1) - start;
    const stepping = (undefined != step) ? step : 1;

    return Array.apply(null, { length }).map((cur: any, index: number) => index + 1);
};

export const and = (arr: Array<boolean>): boolean => {
    return arr.reduce((acc, cur) => (true === acc) ? cur : false, true);
};

export const or = (arr: Array<boolean>): boolean => {
    return arr.reduce((acc, cur) => (false === acc) ? cur : true, false);
};

export const isEven = (num: number): boolean => (0 === num % 2);

export const isOdd = (num: number): boolean => (0 !== num % 2);

export const factors = (num: number): Array<number> => {
    const factorLimit = Math.sqrt(num);
    const factors = [];

    for (let iterator = 1; iterator < factorLimit; iterator += 1) {
        if (0 === (num % iterator)) {
            const dividend = num / iterator;

            if (dividend > iterator) {
                factors.push(dividend, iterator);
            } else {
                factors.push(iterator);
            }
        }
    }

    return factors;
};

export const isPrime = (num: number): boolean => {
    const primeLimit = Math.sqrt(num);

    for (let iterator = 2; iterator < primeLimit; iterator += 1) {
        if (0 === num % iterator) {
            return false;
        }
    }

    return true;
}
