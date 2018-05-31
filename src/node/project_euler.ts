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
