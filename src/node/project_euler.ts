'use strict';

export const range = ({ start, end, step }: {start: number; end: number; step?: number}): Array<number> => {
    const length = (end + 1) - start;
    const stepping = (undefined != step) ? step : 1;

    return Array.apply(null, { length }).map((cur: any, index: number) => {
        return index + start;
    });
};

export const not = (value: boolean): boolean => !value;

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

export const isNumberPalindrome = (num: number): boolean => {
    return isWordPalindrome(num.toString());
};

export const erastosthenesSieve = (num: number): Array<number> => {
    const sieveLimit = Math.trunc(Math.sqrt(num)) + 1;
    const multiples: Array<number> = [];
    const removeMultiples = (value: number) => not(multiples.includes(value));

    for (let iterator = 2; iterator < sieveLimit; iterator += 1) {
        for (let multiply = 2; multiply < num; multiply += 1) {
            const product = iterator * multiply;

            if (product > num) {
                break;
            }

            multiples.push(product);
        }
    }

    return range({ start: 2, end: num }).filter(removeMultiples);
};
